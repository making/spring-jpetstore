package ik.am.jpetstore.domain.service.order;

import ik.am.jpetstore.domain.model.Order;

import java.util.List;

public interface OrderService {

    void insertOrder(Order order);

    Order getOrder(int orderId);

    List<Order> getOrdersByUsername(String username);

    int getNextId(String name);

}
