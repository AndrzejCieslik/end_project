package andrzej.cieslik.ac.end_project.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {
    User findByUsername(String username);
    List<User> findAllByFirstName(String firstName);
    List<User> findAllByLastName(String lastName);
    List<User> findAllByCity(String city);
    List<User> findAllByFirstNameAndLastName(String firstname, String lastName);
    Optional<User> findById(Long id);
    List<User> findAllByFirstNameAndAndLastNameAndCity(String firstName,String lastName,String City);
}
