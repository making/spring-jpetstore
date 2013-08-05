package ik.am.jpetstore.app.account;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("account")
public class AccountController {

	private static final List<String> LANGUAGE_LIST;
	private static final List<String> CATEGORY_LIST;

	static {
		List<String> langList = new ArrayList<String>();
		langList.add("english");
		langList.add("japanese");
		LANGUAGE_LIST = Collections.unmodifiableList(langList);

		List<String> catList = new ArrayList<String>();
		catList.add("FISH");
		catList.add("DOGS");
		catList.add("REPTILES");
		catList.add("CATS");
		catList.add("BIRDS");
		CATEGORY_LIST = Collections.unmodifiableList(catList);
	}

	@ModelAttribute("languageList")
	public List<String> getLanguageList() {
		return LANGUAGE_LIST;
	}

	@ModelAttribute("categoryList")
	public List<String> getCategoryList() {
		return CATEGORY_LIST;
	}

	@ModelAttribute
	public AccountForm setUpForm() {
		return new AccountForm();
	}

	@RequestMapping("signonForm")
	public String signonForm() {
		return "account/SignonForm";
	}

	@RequestMapping("newAccountForm")
	public String newAccountForm() {
		return "account/NewAccountForm";
	}
}
