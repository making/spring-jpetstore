package ik.am.jpetstore.domain.model;

import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

public class UserDetails
                        implements
                        org.springframework.security.core.userdetails.UserDetails {
    private static final long serialVersionUID = 1L;

    private final Account account;

    private final List<Product> myList;

    public UserDetails(Account account, List<Product> myList) {
        this.account = account;
        this.myList = new CopyOnWriteArrayList<Product>(myList);
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return Collections
                .singletonList(new SimpleGrantedAuthority("ROLE_USER"));
    }

    @Override
    public String getPassword() {
        return account.getPassword();
    }

    @Override
    public String getUsername() {
        return account.getUsername();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    public Account getAccount() {
        return account;
    }

    public List<Product> getMyList() {
        return myList;
    }

}
