package com.ajo.cah.entities;

import com.gamecon.schema.AbstractIdItem;

public class CahUser extends AbstractIdItem<Integer> {

  private String name;
  private UserProxy userProxy;
  
  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public UserProxy getUserProxy() {
    return userProxy;
  }

  public void setUserProxy(UserProxy userProxy) {
    this.userProxy = userProxy;
  }
  
}
