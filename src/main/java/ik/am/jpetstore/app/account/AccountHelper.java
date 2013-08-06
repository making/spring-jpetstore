package ik.am.jpetstore.app.account;

import java.util.List;

import javax.inject.Inject;

import ik.am.jpetstore.domain.model.Account;
import ik.am.jpetstore.domain.model.Product;
import ik.am.jpetstore.domain.model.UserDetails;
import ik.am.jpetstore.domain.service.account.AccountService;
import ik.am.jpetstore.domain.service.catalog.CatalogService;

import org.dozer.Mapper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

@Component
public class AccountHelper {

    @Inject
    protected Mapper beanMapper;

    @Inject
    protected AccountService accountService;

    @Inject
    protected CatalogService catalogService;

    public void newAccount(AccountForm form) {
        Account account = beanMapper.map(form, Account.class);
        accountService.insertAccount(account);
    }

    public void editAccount(AccountForm form) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        Account account = userDetails.getAccount();

        // does not map "username" to use that of session object
        beanMapper.map(form, account, "accountExcludeUsername");
        accountService.updateAccount(account);

        // reflect new value to session object
        beanMapper.map(accountService.getAccount(account.getUsername()),
                account);
        List<Product> myList = catalogService.getProductListByCategory(account
                .getFavouriteCategoryId());
        // update MyList
        userDetails.getMyList().clear();
        userDetails.getMyList().addAll(myList);

    }
}
