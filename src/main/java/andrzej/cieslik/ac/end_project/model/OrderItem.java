package andrzej.cieslik.ac.end_project.model;

import lombok.*;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name="orderItem")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class OrderItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    private Product product;
    private BigDecimal price;
    private int quantity;
    @ManyToOne
    private Order order;

    public OrderItem(Product product, BigDecimal price, int quantity, Order order) {
        this.product = product;
        this.price = price;
        this.quantity = quantity;
        this.order = order;
    }
}
