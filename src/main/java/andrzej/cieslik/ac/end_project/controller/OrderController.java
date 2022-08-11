

package andrzej.cieslik.ac.end_project.controller;

import andrzej.cieslik.ac.end_project.model.Order;
import andrzej.cieslik.ac.end_project.model.OrderState;
import andrzej.cieslik.ac.end_project.repository.OrderRepository;
import andrzej.cieslik.ac.end_project.service.OrderService;
import andrzej.cieslik.ac.end_project.user.UserRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/order-form")
public class OrderController {

    private final OrderRepository orderRepository;
    private final UserRepository userRepository;
    private final OrderService orderService;


    public OrderController(OrderRepository orderRepository, UserRepository userRepository, OrderService orderService) {
        this.orderRepository = orderRepository;
        this.userRepository = userRepository;

        this.orderService = orderService;
    }

    /*@GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("orders", orderService.getOrdersByUsers());
        return "orders/list";
    }*/

    /*@GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("orders", orderService.getOrderByUserId(1L));
        return "orders/list";
    }*/
    /*@GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("orders", orderService.getOrderByStateAndUserId(OrderState.WAITING_FOR_PAYMENT,1L));
        return "orders/list";
    }*/
    @PostMapping("/list-date")
    public String listDate(Model model,@RequestParam String formDate,@RequestParam String info,@RequestParam OrderState orderState) {
        LocalDate dt = LocalDate.parse(formDate);
        int sign = 0;
        if(info.equalsIgnoreCase("before")){
            sign = -1;
        }else if (info.equalsIgnoreCase("after")){
            sign = 1;
        }
        model.addAttribute("orders", orderService.getOrderByDatesAndState(dt,sign,orderState));
        return "orders/list";
    }
    @GetMapping("/list")
    public String list(Model model) {
       // model.addAttribute("orders", orderService.getOrderByStateAndUserIdAndFirstLastNameAndCity(OrderState.WAITING_FOR_PAYMENT, "ala", "ala", "ala"));
        return "orders/list";
    }

    @PostMapping("/list")
    public String listSelected(Model model,@RequestParam OrderState orderState,String firstName,String lastName, String city) {
        model.addAttribute("orders", orderService.getOrderByStateAndUserIdAndFirstLastNameAndCity(orderState, firstName, lastName, city));
        return "orders/list";
    }


    @GetMapping("/change_order_status")
    public String changeStatus(@RequestParam Long id, @RequestParam OrderState state) {
        LocalDate date = LocalDate.now();
        Optional<Order> orderOptional = orderRepository.getById(id);

        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            order.setOrderState(state);
            if (state == OrderState.PAYED) {
                order.setPaymentDate(date);
            } else if (state == OrderState.DELIVERED) {
                order.setDeliveryDate(date);
            } else if (state == OrderState.CANCELED) {
                order.setCancelDate(date);
            }
            orderRepository.save(order);
        }

        return "redirect:list";
    }

    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("orders", new Order());
        return "orders/add";
    }

    @PostMapping("/add")
    public String save(Order order) {
        orderRepository.save(order);
        return "redirect:/order-form/list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable long id) {
        orderRepository.deleteById(id);
        return "redirect:/order-form/list";
    }

    @GetMapping("/edit/{id}")
    public String edit(Model model, @PathVariable long id) {
        model.addAttribute("orders", orderRepository.findById(id));
        return "order/edit";
    }

    @PostMapping("/update")
    public String update(@Valid Order order, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("orders", orderRepository.findById(order.getId()));
            return "orders/edit";
        }
        orderRepository.save(order);
        return "redirect:/order-form/list";
    }
}


