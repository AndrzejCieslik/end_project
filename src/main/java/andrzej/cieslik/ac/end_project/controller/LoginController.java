package andrzej.cieslik.ac.end_project.controller;

import andrzej.cieslik.ac.end_project.user.User;
import andrzej.cieslik.ac.end_project.user.UserRepository;
import andrzej.cieslik.ac.end_project.user.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
public class LoginController {

    private final UserService userService;
    private final UserRepository userRepository;


    public LoginController(UserService userService, UserRepository userRepository) {
        this.userService = userService;
        this.userRepository = userRepository;

    }

    @GetMapping("/admin/test")
    @ResponseBody
    public String adminTest() {
        return "admin/login";
    }

    @GetMapping("/login")
    public String login(Model model, @RequestParam(required = false) Boolean error) {
        if (error != null) {
            model.addAttribute("error", error);
        }
        return "admin/login";
    }

    @GetMapping("/create-user")
    public String createUser(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "users/add";
    }

    @PostMapping("/create-user")

    public String saveUser(@Valid @ModelAttribute("user") User user, BindingResult result) {
            if(userRepository.findByUsername(user.getUsername()) != null) {
                result.rejectValue("username","error.username","username already in use");
                return "users/add";
        }
        if (result.hasErrors()) {
            return "users/add";
        }
        userService.saveUser(user);
        return "redirect:/product-form/list";
    }
}
