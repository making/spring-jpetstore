package ik.am.jpetstore.app.cart;

import java.util.Map;

public class CartForm {
    private Map<String, Integer> quantity;

    public void setQuantity(Map<String, Integer> quantity) {
        this.quantity = quantity;
    }

    public Map<String, Integer> getQuantity() {
        return quantity;
    }

    @Override
    public String toString() {
        return "CartForm [quantity=" + quantity + "]";
    }
}
