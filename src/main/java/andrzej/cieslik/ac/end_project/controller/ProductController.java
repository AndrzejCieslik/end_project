package andrzej.cieslik.ac.end_project.controller;

import andrzej.cieslik.ac.end_project.model.Product;
import andrzej.cieslik.ac.end_project.repository.ProductRepository;
import andrzej.cieslik.ac.end_project.service.Cart;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping("product-form")
public class ProductController {

    private final ProductRepository productRepository;
    private final Cart cart;

    public ProductController(ProductRepository productRepository, Cart cart) {
        this.productRepository = productRepository;
        this.cart = cart;
    }

    @GetMapping("/list")
    public String list(Model model){
        model.addAttribute("products", productRepository.findActiveProducts(true));
        model.addAttribute("itemsCount", cart.getCartItems().size());
        return "products/list_buy";
    }
    @GetMapping("/list_to_edit")
    public String listToEdit(Model model){
        System.out.println("xxxx");
        model.addAttribute("products", productRepository.findAll());
        return "products/list_to_edit_for_admin";
    }

    @GetMapping("/add")
    public String add(Model model){
        model.addAttribute("products", new Product());
        return "products/add";
    }
    @PostMapping("/add")
    public String save(Product product){
        productRepository.save(product);
        return "redirect:/product-form/list";
    }
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable long id) {
        productRepository.deactivateProduct(id);
        return "redirect:/product-form/list";

    }
    @GetMapping("/edit/{id}")
    public String edit(Model model,@PathVariable long id){
        model.addAttribute("products",productRepository.findById(id));
        return "products/edit";
    }
    @PostMapping("/update")
    public String update(@Valid Product product, BindingResult result, Model model) {
        if(result.hasErrors()){
            model.addAttribute("products",productRepository.findById(product.getId()));
            return "products/edit";
        }
        productRepository.save(product);
        return "redirect:/product-form/list";
    }
}
