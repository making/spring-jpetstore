package ik.am.jpetstore.app.common.search;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class ProductSearchControllerAdvice {
	@ModelAttribute
	public ProductSearchForm setupForm() {
		return new ProductSearchForm();
	}
}
