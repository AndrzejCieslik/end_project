package andrzej.cieslik.ac.end_project.controller;

import andrzej.cieslik.ac.end_project.model.Order;
import andrzej.cieslik.ac.end_project.model.OrderItem;
import andrzej.cieslik.ac.end_project.model.Product;
import andrzej.cieslik.ac.end_project.repository.OrderItemRepository;
import andrzej.cieslik.ac.end_project.repository.OrderRepository;
import andrzej.cieslik.ac.end_project.repository.ProductRepository;
import andrzej.cieslik.ac.end_project.service.Cart;
import andrzej.cieslik.ac.end_project.service.CartItem;
import andrzej.cieslik.ac.end_project.user.User;
import andrzej.cieslik.ac.end_project.user.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.Optional;

import static andrzej.cieslik.ac.end_project.model.OrderState.WAITING_FOR_PAYMENT;

@Controller

public class CartController {
    private final Cart cart;
    private final UserService userService;
    private final OrderItemRepository orderItemRepository;
    private final OrderRepository orderRepository;
    private final ProductRepository productRepository;

    public CartController(Cart cart, UserService userService, OrderItemRepository orderItemRepository, OrderRepository orderRepository, ProductRepository productRepository) {
        this.cart = cart;
        this.userService = userService;
        this.orderItemRepository = orderItemRepository;
        this.orderRepository = orderRepository;

        this.productRepository = productRepository;
    }

    @PostMapping("/add_to_cart")
    public String addToCart(Model model, @RequestParam Long id, @RequestParam int quantity ) {
        Optional<Product> productOptional = productRepository.findById(id);
        boolean flag = true;
        if(productOptional.isPresent()){
            for(CartItem cartItem: cart.getCartItems()){
              if(productOptional.get().getName().equals(cartItem.getProduct().getName())){
                  cartItem.setQuantity(cartItem.getQuantity() + quantity);
                  flag = false;
              }
            }
           if(flag){
               cart.addToCart(new CartItem(quantity, productOptional.get()));
           }
        }else{}
        return "redirect:/product-form/list";
    }

    @PostMapping("/edit_cart")
    public String editCart(@RequestParam Long id, @RequestParam int quantity){
        Optional<Product> productOptional = productRepository.findById(id);
        if(productOptional.isPresent()){
            for(CartItem cartItem: cart.getCartItems()){
                if(productOptional.get().getName().equals(cartItem.getProduct().getName())){
                    cartItem.setQuantity(cartItem.getQuantity() - cartItem.getQuantity() +quantity);
                }
            }
        }
        return "redirect:/cart";
    }

    @GetMapping("/cart")
    public String cart(Model model) {
        model.addAttribute("cart",cart.getCartItems());
        return "cart/pay_list";
    }

    @PostMapping("/delete_position_in_cart")
    public String deletePositionFromCart(@RequestParam Long id){
        Optional<Product> productOptional = productRepository.findById(id);
        CartItem temp = null;
        if(productOptional.isPresent()){
            for(CartItem cartItem: cart.getCartItems()){
                if(productOptional.get().getName().equals(cartItem.getProduct().getName())){
                    temp = cartItem;
                    //cart.getCartItems().remove(cartItem);
                }
            }
        }
        cart.getCartItems().remove(temp);
        return "redirect:/cart";
    }
    int order = 0;
    @GetMapping("/save_cart")
    public String saveCart (){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findByUserName(auth.getName());
        LocalDate localDate = LocalDate.now();
        Order order = new Order(user,WAITING_FOR_PAYMENT,localDate);
        orderRepository.save(order);
            for (CartItem cartItem: cart.getCartItems()){
                orderItemRepository.save(new OrderItem(cartItem.getProduct(),cartItem.getProduct().getPrice(),cartItem.getQuantity(), order));
        }
        return "redirect:/product-form/list";
    }
}
