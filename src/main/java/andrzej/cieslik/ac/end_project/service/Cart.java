package andrzej.cieslik.ac.end_project.service;

import andrzej.cieslik.ac.end_project.model.Product;
import andrzej.cieslik.ac.end_project.repository.ProductRepository;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Component
@Scope(value = WebApplicationContext.SCOPE_SESSION,proxyMode = ScopedProxyMode.TARGET_CLASS)
public class Cart {
    private final ProductRepository productRepository;
    private final List<CartItem> cartItems= new ArrayList<>();

    public Cart(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }
    public void addToCart(CartItem cartItem){
        cartItems.add(cartItem);
    }

    public void updateProducts() {
        List<Long> productIds = cartItems.stream().map(n -> n.getProduct().getId()).toList();
        List<Product> products = productRepository.findByIdIn(productIds);
        for(CartItem cartItem : cartItems){
            for (Product product : products){
                if(cartItem.getProduct().getId().equals(product.getId())){
                    cartItem.setProduct(product);
                    break;
                }
            }
        }
    }
}

