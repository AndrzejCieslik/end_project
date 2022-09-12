package andrzej.cieslik.ac.end_project.service;

import andrzej.cieslik.ac.end_project.model.Order;
import andrzej.cieslik.ac.end_project.model.OrderState;
import andrzej.cieslik.ac.end_project.repository.OrderRepository;
import andrzej.cieslik.ac.end_project.user.User;
import andrzej.cieslik.ac.end_project.user.UserRepository;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.*;

@Component
public class OrderService {

    private final OrderRepository orderRepository;
    private final UserRepository userRepository;

    public OrderService(OrderRepository orderRepository, UserRepository userRepository) {
        this.orderRepository = orderRepository;
        this.userRepository = userRepository;
    }

    public Map<User, List<Order>> getOrdersByUsers() {
        List<Order> orderList = orderRepository.findAll();
        HashMap<User, List<Order>> ordersByUsers = new HashMap<>();
        for (Order order : orderList) {
            getOrCreate(ordersByUsers, order.getUser()).add(order);
        }
        return ordersByUsers;
    }

    public Map<User, List<Order>> getOrderByDatesAndState(LocalDate orderDate, int sign, OrderState orderState) {
        List<Order> orderList = orderRepository.findAllByOrderState(orderState);
        HashMap<User, List<Order>> ordersByDates = new HashMap<>();
        for (Order order : orderList) {
            //if (order.getOrderState().equals(orderState)) {
            int difference = order.getOrderDate().compareTo(orderDate);
            if (sign == 0 && difference == 0) {
                getOrCreate(ordersByDates, order.getUser()).add(order);
            } else if (sign > 0 && difference > 0) {
                getOrCreate(ordersByDates, order.getUser()).add(order);
            } else if (sign < 0 && difference < 0) {
                getOrCreate(ordersByDates, order.getUser()).add(order);
            }
            // }
        }
        return ordersByDates;
    }

    public Map<User, List<Order>> getOrderByStateAndUserIdAndFirstLastNameAndCity(OrderState orderState, String firstName, String lastName, String city) {
        List<Order> orderList = orderRepository.findAllByOrderState(orderState);
        List<User> tempList = userRepository.findAllByFirstNameAndAndLastNameAndCity(firstName, lastName, city);
        HashMap<User, List<Order>> ordersByOrderState = new HashMap<>();
        for (Order order : orderList) {
            for (User tempListItem : tempList)
                if (tempListItem.equals(order.getUser())) {
                    getOrCreate(ordersByOrderState, order.getUser()).add(order);
                }
        }
        return ordersByOrderState;
    }

    private List<Order> getOrCreate(Map<User, List<Order>> map, User user) {
        List<Order> list = map.get(user);
        if (list == null) {
            list = new ArrayList<>();
            map.put(user, list);
        }
        return list;
    }
}
