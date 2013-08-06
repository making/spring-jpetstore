package ik.am.jpetstore.app.cart;

import javax.inject.Inject;

import ik.am.jpetstore.domain.model.Cart;
import ik.am.jpetstore.domain.service.catalog.CatalogService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("cart")
public class CartController {
    @Inject
    protected CartHelper cartHelper;

    @Inject
    protected CatalogService catalogService;

    @Inject
    protected Cart cart;

    @ModelAttribute
    public CartForm setUpForm() {
        return new CartForm();
    }

    @ModelAttribute
    public Cart getCart() {
        return cart;
    }

    @RequestMapping("viewCart")
    public String viewCart() {
        return "cart/Cart";
    }

    @RequestMapping("addItemToCart")
    public String addItemToCart(
            @RequestParam("workingItemId") String workingItemId) {
        cartHelper.addItemToCart(workingItemId, cart);
        return "redirect:/cart/viewCart";
    }

    @RequestMapping("updateCartQuantities")
    public String updateCartQuantities(CartForm cartForm, Model model) {
        cartHelper.updateCartQuantities(cartForm, cart);
        return "redirect:/cart/viewCart";
    }

    @RequestMapping("removeItemFromCart")
    public String removeItemFromCart(@RequestParam("cartItem") String cartItem) {
        cart.removeItemById(cartItem);
        return "redirect:/cart/viewCart";
    }

    @RequestMapping("checkOut")
    public String checkOut() {
        return "cart/Checkout";
    }

}
