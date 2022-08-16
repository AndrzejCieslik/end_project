package andrzej.cieslik.ac.end_project.model;

import com.sun.istack.NotNull;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.math.BigDecimal;

@Entity
@Table(name = "products")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank
    @Column(length = 50, unique = true)
    private String name;
    @NotBlank
    private String description;
    @NotBlank
    @Column(length = 50)
    private String smallFotoLink;
    @NotBlank
    @Column(length = 50)
    private String fotosLink;
    @NotNull
    private Long deliveryPeriod;
    @NotNull
    private BigDecimal price;
    @NotNull
    private Long quantity;
    @NotNull
    private boolean active;

    public Product(String name, String description, String smallFotoLink, String fotosLink, Long deliveryPeriod, BigDecimal price, Long quantity, boolean active) {
        this.name = name;
        this.description = description;
        this.smallFotoLink = smallFotoLink;
        this.fotosLink = fotosLink;
        this.deliveryPeriod = deliveryPeriod;
        this.price = price;
        this.quantity = quantity;
        this.active = active;
    }
}

