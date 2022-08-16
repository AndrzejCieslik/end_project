package andrzej.cieslik.ac.end_project.repository;

import andrzej.cieslik.ac.end_project.model.Order;
import andrzej.cieslik.ac.end_project.model.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface OrderItemRepository extends JpaRepository<OrderItem,Long> {

    List<OrderItem> findAllByOrder(Order order);

    /*@Transactional
   public void insertWithQuery(OrderItem orderItem){

    }*/
}
