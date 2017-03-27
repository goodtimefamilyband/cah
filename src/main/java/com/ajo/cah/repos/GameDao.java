package com.ajo.cah.repos;

import java.util.HashMap;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.ajo.cah.game.CahGame;

@Repository
public class GameDao extends AbstractIdDAO<CahGame> {

  private SimpleJdbcInsert gameAdder;
  
  @Autowired
  private CardDao cardDao;
  
  protected GameDao() {
    super("game", "id");
    // TODO Auto-generated constructor stub
  }

  @Autowired
  public void setDataSource(DataSource dataSource) {
    super.setDataSource(dataSource);
    
    gameAdder = new SimpleJdbcInsert(dataSource)
    .withTableName("game")
    .usingColumns("name")
    .usingGeneratedKeyColumns("id");
  }
  
  public CahGame getNew(String name) {
    HashMap<String, Object> args = new HashMap<>();
    args.put("name", name);
    Number id = gameAdder.executeAndReturnKey(args);
    
    CahGame g = new CahGame();
    g.setId(id.intValue());
    g.setName(name);
    cardDao.initGame(g);
    
    return g;
  }
}
