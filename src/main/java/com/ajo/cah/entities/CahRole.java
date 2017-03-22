package com.ajo.cah.entities;

import com.gamecon.schema.AbstractIdItem;

public class CahRole extends AbstractIdItem<Integer> {

  private String name;

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }
  
}
