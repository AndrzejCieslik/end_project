

package andrzej.cieslik.ac.end_project.controller;

import andrzej.cieslik.ac.end_project.model.Order;
import andrzej.cieslik.ac.end_project.model.OrderItem;
import andrzej.cieslik.ac.end_project.model.OrderState;
import andrzej.cieslik.ac.end_project.repository.OrderItemRepository;
import andrzej.cieslik.ac.end_project.repository.OrderRepository;
import andrzej.cieslik.ac.end_project.service.OrderService;
import andrzej.cieslik.ac.end_project.user.UserRepository;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/order-form")
public class OrderController {

    private final OrderRepository orderRepository;
    private final UserRepository userRepository;
    private final OrderService orderService;

    private final OrderItemRepository orderItemRepository;


    public OrderController(OrderRepository orderRepository, UserRepository userRepository, OrderService orderService, OrderItemRepository orderItemRepository) {
        this.orderRepository = orderRepository;
        this.userRepository = userRepository;

        this.orderService = orderService;
        this.orderItemRepository = orderItemRepository;
    }
    @GetMapping("/search")
    public String search(Model model,
                         @RequestParam(required = false) Long orderId,
                         @RequestParam(required = false) String firstName,
                         @RequestParam(required = false) String lastName){
        if (orderId != null) {
            if(orderRepository.getById(orderId).isPresent()){
                return "redirect:/order-form/order/" + orderId;
            } else {
                model.addAttribute("notFound", true);
            }
        } else if (firstName != null && lastName != null) {
            if (firstName.isBlank() && !lastName.isBlank()) {
                model.addAttribute("orders", orderRepository.findAllByUserLastName(lastName));
            } else if (lastName.isBlank() && !firstName.isBlank()) {
                model.addAttribute("orders", orderRepository.findAllByUserFirstName(firstName));
            } else {
                model.addAttribute("orders", orderRepository.findAllByUserFirstNameAndUserLastName(firstName, lastName));
            }
        }
        return "orders/search";
    }
    @PostMapping("/search")
    public String doSearch(@RequestParam(required = false) Long orderId, @RequestParam(required = false) String firstName, @RequestParam(required = false) String lastName) {
        return "redirect:/order-form/search?" + (orderId != null ? "orderId=" + orderId + "&": "") + (firstName != null ? "firstName=" + firstName + "&": "") + (lastName != null ? "lastName=" + lastName : "");
    }

    @GetMapping("/order/{id}")
    public String showOrder(Model model, @PathVariable Long id){
        Optional<Order> orderOpt = orderRepository.getById(id);
        if (orderOpt.isPresent()) {
            Order order = orderOpt.get();
            List<OrderItem> orderItems = orderItemRepository.findAllByOrder(order);
            model.addAttribute("order", order);
            model.addAttribute("orderItems", orderItems);
            BigDecimal total = orderItems.stream().map(oi -> oi.getPrice().multiply(BigDecimal.valueOf(oi.getQuantity()))).reduce(BigDecimal.ZERO, BigDecimal::add);
            model.addAttribute("total", total.toString());
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            boolean isAdmin = auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ADMIN"));
            model.addAttribute("isAdmin", isAdmin);
            return "orders/display";
        }
        return "redirect:/list";
    }

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

    @PostMapping("/list-product-of-orders" )
    public String listOfProductsByNameAndSum(Model model, @RequestParam String type_of_list){
        if(type_of_list.equals("productName")){
            model.addAttribute("orders", orderService.getOrdersByUsers());
            model.addAttribute("sumOnly",true);
        }
        return null;
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
        return "redirect:search";
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


