package ik.am.jpetstore.app.cart;

import java.util.Iterator;

import javax.inject.Inject;

import ik.am.jpetstore.domain.model.Cart;
import ik.am.jpetstore.domain.model.CartItem;
import ik.am.jpetstore.domain.model.Item;
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
        if (cart.containsItemId(workingItemId)) {
            cart.incrementQuantityByItemId(workingItemId);
        } else {
            // isInStock is a "real-time" property that must be updated
            // every time an item is added to the cart, even if other
            // item details are cached.
            boolean isInStock = catalogService.isItemInStock(workingItemId);
            Item item = catalogService.getItem(workingItemId);
            cart.addItem(item, isInStock);
        }
        return "redirect:/cart/viewCart";
    }

    @RequestMapping("updateCartQuantities")
    public String updateCartQuantities(CartForm cartForm, Model model) {
        Iterator<CartItem> cartItems = cart.getAllCartItems();
        while (cartItems.hasNext()) {
            CartItem cartItem = (CartItem) cartItems.next();
            String itemId = cartItem.getItem().getItemId();
            try {
                int quantity = cartForm.getQuantity().get(itemId);
                cart.setQuantityByItemId(itemId, quantity);
                if (quantity < 1) {
                    cartItems.remove();
                }
            } catch (Exception e) {
                // ignore parse exceptions on purpose
            }
        }
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
