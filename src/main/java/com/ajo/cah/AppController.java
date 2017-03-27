package com.ajo.cah;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.ajo.cah.entities.UserProxy;
import com.ajo.cah.game.CahGame;
import com.ajo.cah.game.CahPlayer;
import com.ajo.cah.repos.PlayerDao;
import com.ajo.cah.repos.UserProxyDao;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class AppController {

  @Autowired
  private HashMap<Integer, CahGame> gameTbl;
  
  @Autowired
  private PlayerDao playerDao;

  @Autowired
  private UserProxyDao upDao;
  
  @GetMapping(value="app/{gameId}/model", produces=MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<HashMap<String, Object>> getModel(HttpServletRequest req, 
      HttpServletResponse resp, 
      @PathVariable int gameId, 
      @CookieValue("userproxy") String upId) throws IOException {
    
    CahGame g = gameTbl.get(gameId);
    if(g == null) {
      resp.sendError(HttpServletResponse.SC_NOT_FOUND);
    }
    
    UserProxy up = getUserProxy(upId, resp);
    //int playerId = playerDao.getPlayerId(up, g);
    //System.out.println("Model Player ID:" + playerId);
    CahPlayer p = g.getPlayer(up.getId());
    /*if(p == null) {
      resp.sendError(sc);
    }*/
    
    System.out.println("Model player: " + p);
    
    HashMap<String, Object> model = new HashMap<>();
    model.put("player", p.getModel());
    model.put("game", g.getModel());
    
    /*
    ObjectMapper mapper = new ObjectMapper();
    mapper.writeValue(resp.getOutputStream(), model);
    */
    return new ResponseEntity<>(model, HttpStatus.OK);
    
  }
  
  // TODO: Extend controllers?
  public UserProxy getUserProxy(String id, HttpServletResponse resp) {
    //int upId = Integer.parseInt(id);
    if(id.equals(BasicController.USER_PROXY_NOEXIST)) {
      UserProxy up = upDao.getNew();
      resp.addCookie(new Cookie("userproxy", up.getId().toString()));
      return up;
    }
    
    return upDao.getForId(Integer.parseInt(id));
  }
  
  @GetMapping("app/{gameId}/")
  public String app(ModelMap model, @PathVariable int gameId) {
    if(!gameTbl.containsKey(gameId)) {
      throw new ResourceNotFoundException();
    }
    
    model.addAttribute("gameId", gameId);
    return "app";
  }
}
