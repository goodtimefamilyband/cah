package com.ajo.cah.game;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;
import java.util.Set;

import com.ajo.cah.entities.BlackCard;
import com.ajo.cah.entities.WhiteCard;
import com.ajo.cah.entities.WhiteCards;
import com.gamecon.Exception.PlayerParticipationException;
import com.gamecon.GameState;
import com.gamecon.Player;
import com.gamecon.turnbased.MappedStateTurnGame;
import com.gamecon.turnbased.TurnGame;

public class CahGame extends TurnGame<CahPlayer> {

  private Map<CahPlayer, WhiteCards> currentWhiteCards;
  private BlackCard currentBlackCard;
  private Set<CahPlayer> waitingPlayers;
  private LinkedList<CahPlayer> winners;
  
  private CahStateWhite whiteState;
  private CahLockState lockState;
  private CahStateBlack blackState;
  
  public CahGame() {
    blackState = new CahStateBlack(this);
    whiteState = new CahStateWhite(this);
    lockState = new CahLockState(this);
    
    whiteState.setLockState(lockState);
    
    lockState.setBlackState(blackState);
    
  }
  
  @Override
  public boolean gameOver() {
    // TODO Auto-generated method stub
    return false;
  }

  public BlackCard getCurrentBlackCard() {
    return currentBlackCard;
  }

  public void setCurrentBlackCard(BlackCard currentBlackCard) {
    this.currentBlackCard = currentBlackCard;
  }

  public Map<CahPlayer, WhiteCards> getCurrentWhiteCards() {
    return currentWhiteCards;
  }

  public void setCurrentWhiteCards(Map<CahPlayer, WhiteCards> currentWhiteCards) {
    this.currentWhiteCards = currentWhiteCards;
  }

  public Set<CahPlayer> getWaitingPlayers() {
    return waitingPlayers;
  }

  public void setWaitingPlayers(Set<CahPlayer> waitingPlayers) {
    this.waitingPlayers = waitingPlayers;
  }

  public LinkedList<CahPlayer> getWinners() {
    return winners;
  }

  public void setWinners(LinkedList<CahPlayer> winners) {
    this.winners = winners;
  }
  
}
