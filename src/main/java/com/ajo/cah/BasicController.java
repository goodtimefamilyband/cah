package com.ajo.cah;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.style.DefaultValueStyler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ajo.cah.entities.CahUser;
import com.ajo.cah.entities.UserProxy;
import com.ajo.cah.game.CahGame;
import com.ajo.cah.repos.GameDao;
import com.ajo.cah.repos.PlayerDao;
import com.ajo.cah.repos.UserDao;
import com.ajo.cah.repos.UserProxyDao;
import com.gamecon.Exception.PlayerParticipationException;

@Controller
public class BasicController {

  private static final String USER_PROXY_NOEXIST = "-1";
  //private static final String USER_PROXY_NOEXIST_STR = Integer.toString(USER_PROXY_NOEXIST);
  
  private HashMap<Integer, CahGame> games = new HashMap<>();
  
  @Autowired
  private UserDao userDao;
  
  @Autowired
  private GameDao gameDao;
  
  @Autowired
  private UserProxyDao upDao;
  
  @Autowired
  private PlayerDao playerDao;
  
  public BasicController() {
    //game = new CahGame();
  }
  
  @GetMapping("/")
  public String addBoardForm(HttpServletRequest req, ModelMap model) {
    return "home";
  }
  
  @GetMapping("/hello")
  public String helloPage(HttpServletRequest req) {
    
    return "hello";
  }
  
  //@PathVariable
  //@PathVariable int boardId
  
  @PostMapping(path = "/create", params = "gname")
  public void createPage(HttpServletRequest req, 
      HttpServletResponse resp, 
      @CookieValue(name = "userproxy", defaultValue = USER_PROXY_NOEXIST) String upId,
      @RequestParam("gname") String name) throws IOException {
    CahGame g = gameDao.getNew(name);
    games.put(g.getId(), g);
    UserProxy up = getUserProxy(upId, resp);
    
    try {
      playerDao.addPlayer(up, g);
      resp.sendRedirect("app/" + g.getId());
    } catch (PlayerParticipationException e) {
      e.printStackTrace();
      resp.sendError(HttpServletResponse.SC_FORBIDDEN);
    }
  }
  
  @GetMapping("/join/{gameId}")
  public void join(HttpServletRequest req,
      HttpServletResponse resp,
      @CookieValue(name = "userproxy", defaultValue = USER_PROXY_NOEXIST) String upId,
      @PathVariable int gameId) throws IOException {
    
    UserProxy up = getUserProxy(upId, resp);
    
    CahGame g = games.get(gameId);
    if(g == null) {
      resp.sendError(HttpServletResponse.SC_NOT_FOUND);
    }
    
    try {
      playerDao.addPlayer(up, g);
    } catch (PlayerParticipationException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
      resp.sendError(HttpServletResponse.SC_FORBIDDEN);
    }
    
    resp.sendRedirect("app/" + g.getId());
  }
  
  public UserProxy getUserProxy(String id, HttpServletResponse resp) {
    //int upId = Integer.parseInt(id);
    if(id.equals(USER_PROXY_NOEXIST)) {
      UserProxy up = upDao.getNew();
      resp.addCookie(new Cookie("userproxy", up.getId().toString()));
      return up;
    }
    
    return upDao.getForId(Integer.parseInt(id));
  }
  /*
  @GetMapping("/login")
  public String login(
      @RequestParam(value = "error", required = false) String error,
      @RequestParam(value = "logout", required = false) String logout,
      ModelMap model) {
      if (error != null) {
        model.addAttribute("error", "Invalid username/password");
      }

      if (logout != null) {
        model.addAttribute("msg", "You've been logged out successfully.");
      }
      
      return "login";

    }
    */
  
  @GetMapping("/signup")
  public String signup() {
    return "signup";
  }
  
  @PostMapping("/signup") 
  public String signup(
      @RequestParam(value = "username") String username,
      @RequestParam(value = "password") String password,
      @RequestParam(value = "password2") String password2,
      HttpServletRequest req,
      ModelMap model
      ){
    
    if(!password.equals(password2)) {
      model.addAttribute("error", "Passwords do not match");
      return "signup";
    }
    
    System.out.println(password);
    
    CahUser u = this.userDao.addUser(username, password);
    
    model.addAttribute("msg", "User was added successfully with ID " + u.getId());
    return "signup";
  }
    

}