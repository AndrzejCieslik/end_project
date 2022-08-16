package andrzej.cieslik.ac.end_project.repository;

import andrzej.cieslik.ac.end_project.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findAllByName(String name);
    Optional<Product> findById(Long id);

    @Query("select p from Product p where p.active = ?1")
    List<Product> findActiveProducts(Boolean active);

    List<Product> findByIdIn(List<Long> ids);

    Optional<Product> getById(Long id);

}
