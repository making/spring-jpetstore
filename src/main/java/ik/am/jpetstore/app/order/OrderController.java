package ik.am.jpetstore.app.order;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import ik.am.jpetstore.domain.model.Account;
import ik.am.jpetstore.domain.model.Cart;
import ik.am.jpetstore.domain.model.Order;
import ik.am.jpetstore.domain.model.UserDetails;
import ik.am.jpetstore.domain.service.order.OrderService;

import javax.inject.Inject;

import org.dozer.Mapper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("order")
@SessionAttributes("scopedTarget.cart")
public class OrderController {

    private static final List<String> CARD_TYPE_LIST;

    @Inject
    protected OrderHelper orderHelper;

    @Inject
    protected OrderService orderService;

    @Inject
    protected Mapper beanMapper;

    @Inject
    protected Cart cart;

    static {
        List<String> cardList = new ArrayList<String>();
        cardList.add("Visa");
        cardList.add("MasterCard");
        cardList.add("American Express");
        CARD_TYPE_LIST = Collections.unmodifiableList(cardList);
    }

    @ModelAttribute
    public OrderForm setUpForm() {
        return new OrderForm();
    }

    @ModelAttribute("creditCardTypes")
    public List<String> getCardTypeList() {
        return CARD_TYPE_LIST;
    }

    @RequestMapping("newOrderForm")
    public String newOrderForm(OrderForm orderForm, Model model) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        Account account = userDetails.getAccount();

        Order order = new Order();
        order.initOrder(account, cart);
        beanMapper.map(order, orderForm);
        model.addAttribute(order);

        return "order/NewOrderForm";
    }

    @RequestMapping(value = "newOrder")
    public String confirmOrder(OrderForm orderForm, Order order) {
        return "order/ConfirmOrder";
    }

    @RequestMapping(value = "newOrder", params = "shippingAddressRequired=true")
    public String shippingForm(OrderForm orderForm, Order order) {
        return "order/ShippingForm";
    }

    @RequestMapping(value = "newOrder", params = "confirmed")
    public String newOrder(OrderForm orderForm, SessionStatus status,
            RedirectAttributes attributes) {
        Order order = orderHelper.newOrder(orderForm, cart);

        attributes.addAttribute("orderId", order.getOrderId());
        attributes.addFlashAttribute("message",
                "Thank you, your order has been submitted.");
        status.setComplete();
        return "redirect:/order/viewOrder";
    }

    @RequestMapping("viewOrder")
    public String viewOrder(@RequestParam("orderId") int orderId, Model model) {
        Order order = orderService.getOrder(orderId);

        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        Account account = userDetails.getAccount();
        if (account.getUsername().equals(order.getUsername())) {
            model.addAttribute(order);
            return "order/ViewOrder";
        } else {
            // TODO
            model.addAttribute("You may only view your own orders.");
            return "common/Error";
        }
    }

    @RequestMapping("listOrders")
    public String listOrders(Model model) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        String username = userDetails.getUsername();
        List<Order> orderList = orderService.getOrdersByUsername(username);
        model.addAttribute("orderList", orderList);
        return "order/ListOrders";
    }
}
