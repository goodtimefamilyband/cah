package com.ajo.cah.repos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.ajo.cah.entities.CahUser;

@Repository
public class UserDao extends AbstractIdDAO<CahUser> {

  private static final String USERID_FOR_USERNAME_SQL =
      "SELECT id FROM users WHERE username = ?";
  
  private SimpleJdbcInsert userAdder;
  
  @Autowired
  private PasswordEncoder passwordEncoder;
  
  @Autowired
  private RoleDao roleDao;
  
  @Autowired
  public void setDataSource(DriverManagerDataSource dataSource) {
    super.setDataSource(dataSource);
    
    userAdder = new SimpleJdbcInsert(dataSource)
      .withTableName("users")
      .usingColumns("username", "password")
      .usingGeneratedKeyColumns("id");
  }
  
  protected UserDao() {
    super("users", "id");
  }
  
  public CahUser addUser(String username, String password) {
    List<Integer> userIds = this.jdbcTemplate.query(USERID_FOR_USERNAME_SQL, new Object[]{username}, new RowMapper<Integer>() {

      @Override
      public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
        // TODO Auto-generated method stub
        return rs.getInt("id");
      }
      
    });
    
    if(!userIds.isEmpty()) {
      return null;
    }
    
    String realPwd = this.passwordEncoder.encode(password);
    HashMap<String, Object> args = new HashMap<>();
    args.put("username", username);
    args.put("password", realPwd);
    
    Number id = userAdder.executeAndReturnKey(args);
    CahUser u = new CahUser();
    u.setId(id.intValue());
    u.setName(username);
    
    this.roleDao.addRoleToUser(u, roleDao.getDefaultRole());
    
    return u;
  }
  
}
