package com.ajo.cah.repos;

import java.util.HashMap;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.ajo.cah.entities.UserProxy;
import com.ajo.cah.game.CahGame;
import com.ajo.cah.game.CahPlayer;
import com.gamecon.Exception.PlayerParticipationException;

@Repository
public class PlayerDao extends AbstractIdDAO<CahPlayer> {

  private SimpleJdbcInsert playerAdder;
  
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
    
    return player;
  }

}
