package com.ajo.cah.game;

import com.ajo.cah.entities.BlackCard;
import com.ajo.cah.entities.WhiteCard;
import com.ajo.cah.entities.WhiteCards;
import com.gamecon.GamePiece;
import com.gamecon.GameState;
import com.gamecon.Player;
import com.gamecon.Exception.*;
import com.gamecon.turnbased.TurnGame;

public class CahStateWhite extends GameState<CahPlayer, CahGame> {

  public CahStateWhite(CahGame g) {
    super(g);
    // TODO Auto-generated constructor stub
  }

  private CahLockState lockState;
  
  @Override
  public boolean validateAction(CahPlayer p, GamePiece gp) {
    if(!(gp instanceof WhiteCards)) {
      return false;
    }
    
    WhiteCards wc = (WhiteCards)gp;
    if(wc.getOwner() != p) {
      return false;
    }
    
    if(wc.getCards().size() != this.game.getCurrentBlackCard().getAnswerCount())
      return false;
    
    if(p == this.game.getCurrentPlayer()) {
      return false;
    }
    
    return true;
  }

  @Override
  public String getDisplayName() {
    // TODO Auto-generated method stub
    return "Select a white card";
  }

  @Override
  public boolean allowsAddPlayer() {
    // TODO Auto-generated method stub
    return true;
  }

  @Override
  public boolean allowsRemovePlayer() {
    // TODO Auto-generated method stub
    return true;
  }

  @Override
  public GameState<CahPlayer, CahGame> doAction(CahPlayer p, GamePiece gp) {
    CahGame g = (CahGame)p.getGame();
    BlackCard bc = (BlackCard)gp;
    
    g.getCurrentWhiteCards().put(p, bc.getWhiteCards());
    g.getWaitingPlayers().remove(p);
    
    if(g.getWaitingPlayers().isEmpty()) {
      return lockState;
    }
    else {
      return this;
    }
  }

  public CahLockState getLockState() {
    return lockState;
  }

  public void setLockState(CahLockState lockState) {
    this.lockState = lockState;
  }

}
