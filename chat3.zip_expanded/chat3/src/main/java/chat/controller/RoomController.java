package chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RoomController {
  @GetMapping("/room")
  public String enter(@RequestParam(name = "Id", required = false, defaultValue = "1") String id, Model model) {
    long random = Math.round(Math.random() * 100);
    model.addAttribute("id", id);
    model.addAttribute("random", random);
    return "room";
  }
}
