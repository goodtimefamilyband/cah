package com.ajo.cah.entities;

import java.util.List;

import com.ajo.cah.game.CahPlayer;
import com.gamecon.GamePiece;

public class WhiteCards implements GamePiece {

  private List<WhiteCard> cards;
  private CahPlayer owner;

  public List<WhiteCard> getCards() {
    return cards;
  }

  public void setCards(List<WhiteCard> cards) {
    this.cards = cards;
  }

  public CahPlayer getOwner() {
    return owner;
  }

  public void setOwner(CahPlayer owner) {
    this.owner = owner;
  }
  
}
