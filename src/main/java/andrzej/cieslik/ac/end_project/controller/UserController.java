package andrzej.cieslik.ac.end_project.controller;

import andrzej.cieslik.ac.end_project.user.User;
import andrzej.cieslik.ac.end_project.user.UserRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("user-form")
public class UserController {
    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/list")
    public String list(Model model){
        model.addAttribute("users", userRepository.findAll());
        return "users/list";
    }
    @GetMapping("/add")
    public String add(Model model){
        model.addAttribute("users", new User());
        return "users/add";
    }
    @PostMapping("/add")
    public String save(User user){
        userRepository.save(user);
        return "redirect:/user-form/list";
    }
    @GetMapping("/delete/{id}")
    //@ResponseBody
    public String delete(@PathVariable long id) {
        userRepository.deleteById(id);
        return "redirect:/user-form/list";
    }
    @GetMapping("/edit/{id}")
    public String edit(Model model,@PathVariable long id){
        model.addAttribute("users",userRepository.findById(id));
        return "users/edit";
    }
    @PostMapping("/update")
    public String update(@Valid @ModelAttribute("users") User user, BindingResult result) {
        if(result.getAllErrors().size()>1){

            return "users/edit";
        }
        Optional<User> currentUser = userRepository.findById(user.getId());
        if(currentUser.isPresent()){
            user.setPassword(currentUser.get().getPassword());
            userRepository.save(user);
        }
        return "redirect:/user-form/list";
    }
    @PostMapping("/find-user")
    public String findUserBy(Model model,@RequestParam String firstName,@RequestParam String lastName,@RequestParam String city){
        if(userRepository.findAllByFirstNameAndAndLastNameAndCity(firstName,lastName,city) != null){
            List<User> tempList = userRepository.findAllByFirstNameAndAndLastNameAndCity(firstName,lastName,city);

            //model.addAttribute("userBy",userRepository.findAllByFirstNameAndAndLastNameAndCity(firstName,lastName,city));
        } else if(userRepository.findAllByFirstNameAndLastName(firstName,lastName) != null && userRepository.findAllByCity(city)== null){
            model.addAttribute("usersBy",userRepository.findAllByFirstNameAndLastName(firstName,lastName));
        }
        else if(userRepository.findAllByFirstName(firstName) != null && userRepository.findAllByLastName(lastName) != null){
            model.addAttribute("usersByFirst",userRepository.findAllByFirstName(firstName));
            model.addAttribute("usersByLast",userRepository.findAllByLastName(lastName));
        }
        return null;
    }


}
