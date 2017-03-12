package com.ajo.cah.entities;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.gamecon.GamePiece;

public class BlackCard extends Card {

  public static final String BLANK = "_";
  
  private static final Pattern BLANK_PATTERN = Pattern.compile(BLANK + "*");
  
  public static int generateAnswerCount(String text) {
    Matcher m = BLANK_PATTERN.matcher(text);
    int acount = 0;
    while(m.find()) {
      acount++;
    }
    return acount;
  }
  
  private WhiteCards whiteCards;
  private int answerCount;
  
  public String getText() {
    String text = this.getText();
    String[] textParts = text.split(BLANK);
    StringBuilder txtBuilder = new StringBuilder();
    int i = 0;
    for(; i < whiteCards.getCards().size(); i++) {
      txtBuilder.append(textParts[i]);
      WhiteCard wc = whiteCards.getCards().get(i);
      txtBuilder.append(wc.getText());
    }
    
    for(; i < textParts.length; i++) {
      txtBuilder.append(textParts[i]);
    }
    
    return txtBuilder.toString();
  }

  public void setText(String text) {
    super.setText(text);
    this.answerCount = generateAnswerCount(text);
  }
  
  public WhiteCards getWhiteCards() {
    return whiteCards;
  }
  
  public void setWhiteCard(WhiteCards whiteCards) {
    this.whiteCards = whiteCards;
  }

  public int getAnswerCount() {
    return answerCount;
  }

  /*
  public void setAnswerCount(int answerCount) {
    this.answerCount = answerCount;
  }
  */
  
}
