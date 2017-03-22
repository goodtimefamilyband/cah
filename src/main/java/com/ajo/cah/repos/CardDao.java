package com.ajo.cah.repos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;

import com.ajo.cah.entities.BlackCard;
import com.ajo.cah.entities.Card;
import com.ajo.cah.entities.WhiteCard;
import com.ajo.cah.game.CahGame;
import com.ajo.cah.game.CahPlayer;
import com.gamecon.Game;

/*
 * CREATE TABLE card (
  id INT PRIMARY KEY,
  ctext TEXT,
  isblack BIT
);

CREATE TABLE card_instance (
  id INT PRIMARY KEY,
  cardid INT NOT NULL,
  gameid INT NOT NULL,
  owner INT,
  available BIT,
  deck_order INT NOT NULL,
  FOREIGN KEY (cardid) REFERENCES card (id)
        ON UPDATE CASCADE
        ON DELETE REJECT,
    FOREIGN KEY (gameid) REFERENCES game (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

 */

@Repository
public class CardDao extends AbstractIdDAO<Card> {

  private static final String ALL_CARDS_SQL = "SELECT * FROM card ORDER BY isblack;";
  
  private static final String NEXT_CARD_SQL = 
      "SELECT c.* FROM card"
      + " INNER JOIN card_instance ci ON c.id = ci.cardid"
      + " WHERE ci.gameid = ?"
      + " AND c.isblack = ?"
      + " AND ci.owner IS NULL"
      + " ORDER BY ci.deck_order"
      + " LIMIT 1";
  
  private static final String UPDATE_OWNER_SQL = 
      "UPDATE card_instance SET owner = ? WHERE cardid = ? AND gameid = ?";
  
  protected boolean isBlack;
  
  public CardDao() {
    super("card", "id");
  }
  
  private static final int CARD_WHITE = 0;
  private static final int CARD_BLACK = 1;
  
  private static final String ATTRIBS_FOR_NAME_SQL =
      "SELECT * FROM attribs WHERE name = ?";
  
  private static final String INSERT_CARD_INSTANCE_SQL = 
      "INSERT INTO card_instance (cardid, gameid, deck_order) VALUES (?,?,?)";

  private SimpleJdbcInsert cardInstanceAdder;
  
  @Autowired
  public void setDataSource(DriverManagerDataSource dataSource) {
    super.setDataSource(dataSource);
    
    cardInstanceAdder = new SimpleJdbcInsert(dataSource)
    .withTableName("card")
    .usingColumns("cardid", "gameid");
  }
  
  
  public Card getForId(int id) {
    return super.getForId(id, new CardRowMapper());
  }
  
  public List<Card[]> getAll() {
    List<Card> allCards = super.getAll(new CardRowMapper());
    List<WhiteCard> whiteCards = new LinkedList<>();
    List<BlackCard> blackCards = new LinkedList<>();
    for(Card card : allCards) {
      if(card instanceof WhiteCard) {
        whiteCards.add((WhiteCard)card);
      }
      else if (card instanceof BlackCard){
        blackCards.add((BlackCard)card);
      }
    }
    
    Card[] whiteCardArray = new Card[whiteCards.size()];
    whiteCardArray = whiteCards.toArray(whiteCardArray);
    
    Card[] blackCardArray = new Card[blackCards.size()];
    blackCardArray = blackCards.toArray(blackCardArray);
    
    List<Card[]> cards = new ArrayList<>(2);
    cards.add(CARD_WHITE, whiteCardArray);
    cards.add(CARD_BLACK, blackCardArray);
    
    return cards;
  }
  
  public void initGame(CahGame g) {
    List<Card[]> cardLst = this.getAll();
    
    Card[] whiteCards = cardLst.get(CARD_WHITE);
    Card[] blackCards = cardLst.get(CARD_BLACK);
    
    this.jdbcTemplate.batchUpdate(INSERT_CARD_INSTANCE_SQL, 
        new InitGameBatchSetter(whiteCards, blackCards, g.getId()));
    
  }
  
  public Card getNextFreeCard(int type, Game g) {
    List<Card> cList = this.jdbcTemplate.query(
        NEXT_CARD_SQL, 
        new Object[]{g.getId(), type}, 
        new CardRowMapper());
    
    if(cList.size() == 0) {
      return null;
    }
    
    return cList.get(0);
  }
  
  public void setOwner(Card c, CahPlayer p) {
    this.jdbcTemplate.update(UPDATE_OWNER_SQL, p.getId(), c.getId(), p.getGame().getId());
  }
  
  public boolean draw(CahPlayer p, int type) {
    Card c = getNextFreeCard(type, p.getGame());
    if(c == null) {
      return false;
    }
    
    setOwner(c, p);
    return true;
  }
  
  public class CardRowMapper implements RowMapper<Card> {

    @Override
    public Card mapRow(ResultSet rs, int rowNum) throws SQLException {
      
      Card c;
      if(rs.getBoolean("isblack")) {
        c = new WhiteCard();
      }
      else {
        c = new BlackCard();
      }
      
      c.setId(rs.getInt("id"));
      c.setText(rs.getString("ctext"));
      
      return c;
    }
    
  }
  
  public class InitGameBatchSetter implements BatchPreparedStatementSetter {

    private int whiteMax;
    private int blackMax;
    
    private Card[] whiteCards;
    private Card[] blackCards;
    
    private int constParam;
    
    private Random r;
    
    public InitGameBatchSetter(Card[] whiteCards, Card[] blackCards, int constParam) {
      this.r = new Random(System.currentTimeMillis());
      
      this.whiteCards = whiteCards;
      this.blackCards = blackCards;
      
      this.whiteMax = whiteCards.length;
      this.blackMax = blackCards.length;
      
      this.constParam = constParam;
    }
    
    @Override
    public void setValues(PreparedStatement ps, int i) throws SQLException {
      
      Card[] carr;
      int max;
      if(whiteMax != 0) {
        carr = whiteCards;
        max = whiteMax--;
      }
      else {
        carr = blackCards;
        max = blackMax--;
      }
      
      int idx = r.nextInt(max);
      Card c = carr[idx];
      arraySwap(carr, idx, max);
      
      ps.setInt(1, c.getId());
      ps.setInt(2, constParam);
      ps.setInt(3, i);
    }

    @Override
    public int getBatchSize() {
      return whiteCards.length + blackCards.length;
    }
    
    private void arraySwap(Card[] array, int swap1, int swap2) {
      Card temp = array[swap1];
      array[swap1] = array[swap2];
      array[swap2] = temp;
    }
    
  }
}
