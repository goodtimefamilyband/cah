package com.ajo.cah.game;

import java.util.List;

import com.ajo.cah.entities.BlackCard;
import com.ajo.cah.entities.WhiteCard;
import com.gamecon.Exception.PlayerParticipationException;
import com.gamecon.Game;
import com.gamecon.GamePiece;
import com.gamecon.GameState;
import com.gamecon.Player;
import com.gamecon.schema.Modelable;
import com.gamecon.turnbased.TurnGame;
import com.gamecon.turnbased.TurnPlayer;

public class CahPlayer extends TurnPlayer implements Modelable<CahPlayer.Model> {

  private List<BlackCard> blackCards;
  private List<WhiteCard> whiteCards;
  
  public CahPlayer(String name, CahGame g, int turnOrder) {
    super(name, g, turnOrder);
  }
  
  
  public CahPlayer(String name, CahGame g) throws PlayerParticipationException {
    super(name, g);
    g.addPlayer(this);
  }
  

  /*
  @Override
  public GameState<CahPlayer> doAction(GamePiece gp) {
    
    CahGame g = (CahGame)this.getGame();
    GameState currentState = g.getCurrentState();
    
    if(currentState instanceof CahStateWhite) {
      BlackCard bc = (BlackCard)gp;
      
      g.getCurrentWhiteCards().put(this, bc.getWhiteCards());
      g.getWaitingPlayers().remove(this);
      
      if(g.getWaitingPlayers().isEmpty()) {
        return g.getNextState("wait_for_current_player");
      }
      else {
        return g.getCurrentState();
      }
    }
    else if(currentState instanceof CahLockState) {
      return g.getNextState("select_winner");
    }
    
    return null;
  }
  */

  public List<BlackCard> getBlackCards() {
    return blackCards;
  }

  public void setBlackCards(List<BlackCard> blackCards) {
    this.blackCards = blackCards;
  }

  public List<WhiteCard> getWhiteCards() {
    return whiteCards;
  }

  public void setWhiteCards(List<WhiteCard> whiteCards) {
    this.whiteCards = whiteCards;
  }
  
  public class Model {
    
    public int getGameId() {
      return CahPlayer.this.getGame().getId();
    }
    
    public List<WhiteCard> getWhiteCards() {
      return CahPlayer.this.whiteCards;
    }

    public List<BlackCard> getBlackCards() {
      return CahPlayer.this.blackCards;
    }
    
  }

  @Override
  public Model getModel() {
    // TODO Auto-generated method stub
    return new Model();
  }

}
