package ik.am.jpetstore.app.catalog;

import java.util.List;

import ik.am.jpetstore.domain.model.Category;
import ik.am.jpetstore.domain.model.Item;
import ik.am.jpetstore.domain.model.Product;
import ik.am.jpetstore.domain.service.catalog.CatalogService;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("catalog")
public class CatalogController {
    @Inject
    protected CatalogService catalogService;

    @RequestMapping
    public String main() {
        return "catalog/Main";
    }

    @RequestMapping("viewCategory")
    public String viewCategory(@RequestParam("categoryId") String categoryId,
            Model model) {
        List<Product> productList = catalogService
                .getProductListByCategory(categoryId);
        Category category = catalogService.getCategory(categoryId);
        model.addAttribute("productList", productList);
        model.addAttribute("category", category);
        return "catalog/Category";
    }

    @RequestMapping("viewProduct")
    public String viewProduct(@RequestParam("productId") String productId,
            Model model) {
        List<Item> itemList = catalogService.getItemListByProduct(productId);
        Product product = catalogService.getProduct(productId);
        model.addAttribute("itemList", itemList);
        model.addAttribute("product", product);
        return "catalog/Product";
    }

    @RequestMapping("viewItem")
    public String viewItem(@RequestParam("itemId") String itemId, Model model) {
        Item item = catalogService.getItem(itemId);
        Product product = item.getProduct();
        model.addAttribute("item", item);
        model.addAttribute("product", product);
        return "catalog/Item";
    }

    @RequestMapping(params = "keyword")
    public String searchProducts(@Validated ProductSearchForm form,
            BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "common/Error";
        }
        String keyword = form.getKeyword().toLowerCase();
        List<Product> productList = catalogService.searchProductList(keyword);
        model.addAttribute("productList", productList);
        return "catalog/SearchProducts";
    }
}
