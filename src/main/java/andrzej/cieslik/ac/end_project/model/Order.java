package andrzej.cieslik.ac.end_project.model;

import andrzej.cieslik.ac.end_project.user.User;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.time.LocalDate;
import java.util.HashMap;

@Entity
@Table(name = "orders")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne(cascade = {CascadeType.ALL})
    private User user;

    private OrderState orderState;
    private LocalDate  orderDate;
    private LocalDate paymentDate;
    private LocalDate deliveryDate;
    private LocalDate cancelDate;
    private String remarks;

    public Order(User user, OrderState orderState,LocalDate orderDate) {
        this.user = user;
        this.orderState = orderState;
        this.orderDate = orderDate;
    }

    @Override
    public int hashCode() {
        return Long.hashCode(id) ;
    }

    @Override
    public boolean equals(Object obj) {
        if(!(obj instanceof Order )){
            return false;
        }
        Order that = (Order) obj;

        return id.equals(that.id);
    }
}
