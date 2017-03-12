package com.ajo.cah.game;

import java.util.List;

import com.ajo.cah.entities.BlackCard;
import com.ajo.cah.entities.WhiteCard;
import com.ajo.cah.entities.WhiteCard;
import com.ajo.cah.entities.WhiteCards;
import com.gamecon.GamePiece;
import com.gamecon.GameState;
import com.gamecon.Player;

public class CahStateBlack extends GameState<CahPlayer, CahGame> {

  public CahStateBlack(CahGame g) {
    super(g);
    // TODO Auto-generated constructor stub
  }

  @Override
  public boolean validateAction(CahPlayer p, GamePiece gp) {
    // TODO Auto-generated method stub
    Player current = ((CahGame)p.getGame()).getCurrentPlayer();
    return p == current && gp instanceof WhiteCard;
  }

  @Override
  public String getDisplayName() {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public boolean allowsAddPlayer() {
    // TODO Auto-generated method stub
    return true;
  }

  @Override
  public boolean allowsRemovePlayer() {
    // TODO Auto-generated method stub
    return false;
  }

  @Override
  public GameState<CahPlayer, CahGame> doAction(CahPlayer p, GamePiece gp) {
    // TODO Auto-generated method stub
    WhiteCards whiteCards = (WhiteCards)gp;
    this.game.getWinners().add(whiteCards.getOwner());
    BlackCard bc = this.game.getCurrentBlackCard();
    
    whiteCards.getOwner().getBlackCards().add(this.game.getCurrentBlackCard());
    return null;
  }

}
