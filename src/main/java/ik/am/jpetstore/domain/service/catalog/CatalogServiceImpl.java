/*
 *    Copyright 2010-2013 the original author or authors.
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
 */

package ik.am.jpetstore.domain.service.catalog;

import ik.am.jpetstore.domain.model.Category;
import ik.am.jpetstore.domain.model.Item;
import ik.am.jpetstore.domain.model.Product;
import ik.am.jpetstore.domain.repository.category.CategoryRepository;
import ik.am.jpetstore.domain.repository.item.ItemRepository;
import ik.am.jpetstore.domain.repository.product.ProductRepository;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

/**
 * @author Eduardo Macarron
 */
@Service
public class CatalogServiceImpl implements CatalogService {

    @Inject
    private CategoryRepository categoryRepository;

    @Inject
    private ItemRepository itemRepository;

    @Inject
    private ProductRepository productRepository;

    /*
     * (non-Javadoc)
     * @see ik.am.jpetstore.domain.service.catalog.CategoryService#getCategoryList()
     */
    @Override
    public List<Category> getCategoryList() {
        return categoryRepository.getCategoryList();
    }

    /*
     * (non-Javadoc)
     * @see ik.am.jpetstore.domain.service.catalog.CategoryService#getCategory(java.lang.String)
     */
    @Override
    public Category getCategory(String categoryId) {
        return categoryRepository.getCategory(categoryId);
    }

    /*
     * (non-Javadoc)
     * @see ik.am.jpetstore.domain.service.catalog.CategoryService#getProduct(java.lang.String)
     */
    @Override
    public Product getProduct(String productId) {
        return productRepository.getProduct(productId);
    }

    /*
     * (non-Javadoc)
     * @see ik.am.jpetstore.domain.service.catalog.CategoryService#getProductListByCategory(java.lang.String)
     */
    @Override
    public List<Product> getProductListByCategory(String categoryId) {
        return productRepository.getProductListByCategory(categoryId);
    }

    // TODO enable using more than one keyword
    /*
     * (non-Javadoc)
     * @see ik.am.jpetstore.domain.service.catalog.CategoryService#searchProductList(java.lang.String)
     */
    @Override
    public List<Product> searchProductList(String keyword) {
        return productRepository.searchProductList("%" + keyword.toLowerCase()
                + "%");
    }

    /*
     * (non-Javadoc)
     * @see ik.am.jpetstore.domain.service.catalog.CategoryService#getItemListByProduct(java.lang.String)
     */
    @Override
    public List<Item> getItemListByProduct(String productId) {
        return itemRepository.getItemListByProduct(productId);
    }

    /*
     * (non-Javadoc)
     * @see ik.am.jpetstore.domain.service.catalog.CategoryService#getItem(java.lang.String)
     */
    @Override
    public Item getItem(String itemId) {
        return itemRepository.getItem(itemId);
    }

    /*
     * (non-Javadoc)
     * @see ik.am.jpetstore.domain.service.catalog.CategoryService#isItemInStock(java.lang.String)
     */
    @Override
    public boolean isItemInStock(String itemId) {
        return itemRepository.getInventoryQuantity(itemId) > 0;
    }
}
