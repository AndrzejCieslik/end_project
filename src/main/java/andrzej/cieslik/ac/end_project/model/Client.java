/*
package andrzej.cieslik.ac.end_project.model;

import lombok.*;
import org.apache.tomcat.jni.Address;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.List;

@Entity
@Table(name = "clients")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Client {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String firstName;
    private String lastName;
    @NotBlank(message = "pole nie może być puste")
    private String city;
    @NotBlank(message = "pole nie może być puste")
    private String street;
    @NotBlank(message = "pole nie może być puste")
    private String number;
    @NotBlank(message = "pole nie może być puste")
    private String postcode;
    @NotBlank(message = "pole nie może być puste")
    private String deliveryAddress;

}
*/
