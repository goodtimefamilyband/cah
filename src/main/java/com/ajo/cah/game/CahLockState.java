package com.ajo.cah.game;

import com.gamecon.GamePiece;
import com.gamecon.GameState;
import com.gamecon.Player;
import com.gamecon.turnbased.TurnGame;

public class CahLockState extends CahStateWhite {

  public CahLockState(CahGame g) {
    super(g);
    this.setLockState(this);
    // TODO Auto-generated constructor stub
  }

  private CahStateBlack blackState;
  
  @Override
  public boolean validateAction(CahPlayer p, GamePiece gp) {
    // TODO Auto-generated method stub
    CahGame cg = (CahGame)p.getGame();
    
    if(p == cg.getCurrentPlayer() && gp == null) {
      return cg.getWaitingPlayers().isEmpty();
    }
    
    return super.validateAction(p, gp);
  }

  @Override
  public String getDisplayName() {
    // TODO Auto-generated method stub
    return "Choose a winner";
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
    Player current = ((CahGame)p.getGame()).getCurrentPlayer();
    if(p == current) {
      return blackState;
    }
    
    return super.doAction(p, gp);
  }

  public CahStateBlack getBlackState() {
    return blackState;
  }

  public void setBlackState(CahStateBlack blackState) {
    this.blackState = blackState;
  }

}
