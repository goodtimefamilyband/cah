package com.ajo.cah.entities;

import com.gamecon.schema.AbstractIdItem;

public class UserProxy extends AbstractIdItem<Integer> {
  
  public static String DEFAULT_NAME = "Anonymous";
  
  private String displayName;
  
  public UserProxy(String name) {
    this.displayName = name;
  }
  
  public UserProxy() {
    this(DEFAULT_NAME);
  }

  public String getDisplayName() {
    return displayName;
  }

  public void setDisplayName(String displayName) {
    this.displayName = displayName;
  }
  
}
