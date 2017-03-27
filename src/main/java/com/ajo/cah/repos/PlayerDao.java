package com.ajo.cah.repos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.ajo.cah.entities.UserProxy;
import com.ajo.cah.game.CahGame;
import com.ajo.cah.game.CahPlayer;
import com.gamecon.Exception.PlayerParticipationException;

@Repository
public class PlayerDao extends AbstractIdDAO<CahPlayer> {

  private static final String PLAYER_FOR_UP_SQL =
      "SELECT * FROM player WHERE userid = ? AND gameid = ?";
  
  private SimpleJdbcInsert playerAdder;
  
  @Autowired
  private CardDao cardDao;
  
  protected PlayerDao() {
    super("player", "id");
  }
  
  @Autowired
  public void setDataSource(DataSource dataSource) {
    super.setDataSource(dataSource);
    
    playerAdder = new SimpleJdbcInsert(dataSource)
    .withTableName("player")
    .usingColumns("gameid", "userid")
    .usingGeneratedKeyColumns("id");
  }
  
  public CahPlayer addPlayer(UserProxy up, CahGame g) throws PlayerParticipationException {
    HashMap<String, Object> args = new HashMap<>();
    args.put("gameid", g.getId());
    args.put("userid", up.getId());
    
    Number id = playerAdder.executeAndReturnKey(args);
    
    CahPlayer player = new CahPlayer(up.getDisplayName(), g);
    player.setId(id.intValue());
    g.mapPlayer(up.getId(), player);
    
    return player;
  }
  
  public int getPlayerId(UserProxy up, CahGame g) {
    List<Integer> ids = this.jdbcTemplate.query(PLAYER_FOR_UP_SQL, new Object[]{up.getId(), g.getId()}, new RowMapper<Integer>() {

      @Override
      public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
        return rs.getInt("id");
      }
      
    });
    
    if(ids.isEmpty()) {
      return -1;
    }
    
    return ids.get(0);
  }

}
