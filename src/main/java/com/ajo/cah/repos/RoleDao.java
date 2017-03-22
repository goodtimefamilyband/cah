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

import com.ajo.cah.entities.CahRole;
import com.ajo.cah.entities.CahUser;

@Repository
public class RoleDao extends AbstractIdDAO<CahRole> {

  private static final String DEFAULT_ROLE_NAME = "ROLE_USER";
  
  private static final String ROLE_FOR_NAME_SQL =
      "SELECT * FROM roles WHERE rolename = ?";
  
  private CahRole defaultRole;
  
  private SimpleJdbcInsert roleUserAdder;
  
  protected RoleDao() {
    super("roles", "id");
  }

  @Autowired
  public void setDataSource(DataSource dataSource) {
    super.setDataSource(dataSource);
    this.defaultRole = this.getForName(DEFAULT_ROLE_NAME);
    
    roleUserAdder = new SimpleJdbcInsert(dataSource)
      .withTableName("role_user")
      .usingColumns("userid", "roleid");
  }
  
  public CahRole getForName(String name) {
    List<CahRole> roles = this.jdbcTemplate.query(ROLE_FOR_NAME_SQL, new Object[]{name}, new CahRoleMapper());
    if(roles.isEmpty()) {
      return null;
    }
    
    return roles.get(0);
  }
  
  public CahRole getDefaultRole() {
    return this.defaultRole;
  }
  
  public void addRoleToUser(CahUser u, CahRole r) {
    HashMap<String, Object> args = new HashMap<>();
    args.put("userid", u.getId());
    args.put("roleid", r.getId());
    
    roleUserAdder.execute(args);
    
  }
  
  public class CahRoleMapper implements RowMapper<CahRole> {

    @Override
    public CahRole mapRow(ResultSet rs, int rowNum) throws SQLException {
      CahRole r = new CahRole();
      r.setId(rs.getInt("id"));
      r.setName(rs.getString("rolename"));
      return r;
    }
  }
}
