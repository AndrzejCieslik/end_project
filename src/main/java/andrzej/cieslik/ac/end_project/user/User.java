package andrzej.cieslik.ac.end_project.user;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Set;

@Entity
@Setter
@Getter
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(nullable = false, unique = true, length = 60)
    @NotNull
    @Size(min = 2, max = 30,message = "enter between 2 and 20 characters")
    private String username;
    @NotBlank
    //@Size(min = 5, message = "enter between 5 and 20 characters")
    private String password;
    private int enabled;
    @NotNull
    @Size(min = 2, max = 30,message = "enter between 2 and 20 characters")
    private String firstName;
    @NotNull
    @Size(min = 2, max = 30,message = "enter between 2 and 20 characters")
    private String lastName;
    @NotNull
    @Size(min = 2, max = 30,message = "enter between 5 and 20 characters")
    private String city;
    private String street;
    private String number;
    private String postcode;
    @NotBlank
    @Email(message = "Please enter a valid e-mail address")
    private String email;
    @NotNull
    @Size(min = 2, max = 30,message = "Please enter between 5 and 20 characters")
    private String deliveryAddress;
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<Role> roles;

}