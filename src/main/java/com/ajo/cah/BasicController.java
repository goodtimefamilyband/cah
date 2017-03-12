package com.ajo.cah;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ajo.cah.game.CahGame;

@Controller
public class BasicController {

  private CahGame game;
  
  public BasicController() {
    
  }
  
  @GetMapping("/")
  public String addBoardForm(HttpServletRequest req, ModelMap model) {
    return "home";
  }
  
  @GetMapping("/hello")
  public String helloPage(HttpServletRequest req) {
    
    return "hello";
  }
  
  @GetMapping("/login")
  public String login(
      @RequestParam(value = "error", required = false) String error,
      @RequestParam(value = "logout", required = false) String logout,
      ModelMap model) {

      if (error != null) {
        model.addAttribute("error", "Invalid username and password!");
      }

      if (logout != null) {
        model.addAttribute("msg", "You've been logged out successfully.");
      }
      
      return "login";

    }
    

}