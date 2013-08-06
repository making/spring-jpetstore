package ik.am.jpetstore.app.catalog;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class ProductSearchForm {
    @NotNull(message = "Please enter a keyword to search for, then press the search button.")
    @Size(min = 1, message = "Please enter a keyword to search for, then press the search button.")
    private String keyword;

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getKeyword() {
        return keyword;
    }
}
