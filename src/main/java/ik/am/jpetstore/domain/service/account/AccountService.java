package ik.am.jpetstore.domain.service.account;

import ik.am.jpetstore.domain.model.Account;

public interface AccountService {

    Account getAccount(String username);

    Account getAccount(String username, String password);

    void insertAccount(Account account);

    void updateAccount(Account account);

}
