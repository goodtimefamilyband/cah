package com.ajo.cah.game;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.ajo.cah.entities.BlackCard;
import com.ajo.cah.entities.WhiteCard;
import com.ajo.cah.entities.WhiteCards;
import com.ajo.cah.repos.CardDao;
import com.gamecon.Exception.PlayerParticipationException;
import com.gamecon.GameState;
import com.gamecon.Player;
import com.gamecon.schema.Modelable;
import com.gamecon.turnbased.MappedStateTurnGame;
import com.gamecon.turnbased.TurnGame;

public class CahGame extends TurnGame<CahPlayer> implements Modelable<CahGame.Model> {

  public static final int CARD_COUNT = 10;
  
  private Map<CahPlayer, WhiteCards> currentWhiteCards;
  private BlackCard currentBlackCard;
  private Set<CahPlayer> waitingPlayers;
  private LinkedList<CahPlayer> winners;
  
  private CahStateWhite whiteState;
  private CahLockState lockState;
  private CahStateBlack blackState;
  
  private Map<Object, CahPlayer> playerMap = new HashMap<>();
  private String name;
  
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
  
  @Override
  public boolean addPlayer(CahPlayer p) throws PlayerParticipationException {
    if(!super.addPlayer(p)) {
      return false;
    }
    System.out.println("addPlayer: Putting player ID " + p.getId());
    //playerMap.put(p.getId(), p);
    
    return true;
  }
  
  public void mapPlayer(Object key, CahPlayer p) {
    playerMap.put(key, p);
  }
  
  public CahPlayer getPlayer(Object key) {
    //System.out.println("getPlayer(" + id + ")");
    return playerMap.get(key);
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }
  
  public static class Model {
    
    private List<PlayerModel> players;
    private BlackCard currentBlackCard;
    
    public List<PlayerModel> getPlayers() {
      return players;
    }
    
    public void setPlayers(List<PlayerModel> players) {
      this.players = players;
    }
    
    public BlackCard getCurrentBlackCard() {
      return currentBlackCard;
    }
    public void setCurrentBlackCard(BlackCard currentBlackCard) {
      this.currentBlackCard = currentBlackCard;
    }
    
    public static class PlayerModel {
      private List<BlackCard> blackCards;
      private String name;
      private int turnOrder;
      
      public List<BlackCard> getBlackCards() {
        return blackCards;
      }
      public void setBlackCards(List<BlackCard> blackCards) {
        this.blackCards = blackCards;
      }
      public String getName() {
        return name;
      }
      public void setName(String name) {
        this.name = name;
      }
      public int getTurnOrder() {
        return turnOrder;
      }
      public void setTurnOrder(int turnOrder) {
        this.turnOrder = turnOrder;
      }
    }
    
  }

  @Override
  public Model getModel() {
    // TODO Auto-generated method stub
    Model m = new Model();
    m.setCurrentBlackCard(currentBlackCard);
    
    List<Model.PlayerModel> pList = new ArrayList<>(players.size());
    Collection<CahPlayer> players = this.getPlayersInOrder();
    
    for(CahPlayer cp : players) {
      Model.PlayerModel pm = new Model.PlayerModel();
      pm.setBlackCards(cp.getBlackCards());
      pm.setName(cp.getName());
      pm.setTurnOrder(cp.getTurnOrder());
      pList.add(pm);
    }
    
    m.setPlayers(pList);
    return m;
  }
  
}
