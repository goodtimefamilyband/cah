package com.ajo.cah.repos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;

import com.ajo.cah.entities.CahRole;
import com.ajo.cah.entities.UserProxy;

@Repository
public class UserProxyDao extends AbstractIdDAO<UserProxy> {

  private SimpleJdbcInsert userProxyAdder;
  
  protected UserProxyDao() {
    super("user_proxy", "id");
  }
  
  @Autowired
  public void setDataSource(DriverManagerDataSource dataSource) {
    super.setDataSource(dataSource);
    
    userProxyAdder = new SimpleJdbcInsert(dataSource)
      .withTableName("user_proxy")
      .usingGeneratedKeyColumns("id");
  }
  
  public UserProxy getNew() {
    Number id = userProxyAdder.executeAndReturnKey(new HashMap<String, Object>());
    
    UserProxy up = new UserProxy();
    up.setId(id.intValue());
    return up;
  }
  
  public UserProxy getForId(int id) {
    return super.getForId(id, new UserProxyMapper());
  }
  
  public class UserProxyMapper implements RowMapper<UserProxy> {

    @Override
    public UserProxy mapRow(ResultSet rs, int rowNum) throws SQLException {
      UserProxy up = new UserProxy();
      up.setId(rs.getInt("id"));
      return up;
    }
  }

}
