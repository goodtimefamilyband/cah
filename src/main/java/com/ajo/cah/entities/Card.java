package com.ajo.cah.entities;

import com.gamecon.GamePiece;
import com.gamecon.schema.AbstractIdItem;

public class Card extends AbstractIdItem<Integer> implements GamePiece {

  private String text;
  
  public String getText() {
    return text;
  }

  public void setText(String text) {
    this.text = text;
  }
  
}
