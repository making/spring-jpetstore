package ik.am.jpetstore.app.common.session;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionActivationListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HttpSessionEventLoggingListener implements HttpSessionListener,
                                            HttpSessionAttributeListener,
                                            HttpSessionBindingListener,
                                            HttpSessionActivationListener {

    private static final Logger logger = LoggerFactory
            .getLogger(HttpSessionEventLoggingListener.class);

    @Override
    public void sessionWillPassivate(HttpSessionEvent se) {
        if (logger.isDebugEnabled()) {
            HttpSession session = se.getSession();
            logger.debug("sessionId={}\tsessionWillPassivate\t{}", session
                    .getId(), se.getSource());
        }
    }

    @Override
    public void sessionDidActivate(HttpSessionEvent se) {
        if (logger.isDebugEnabled()) {
            HttpSession session = se.getSession();
            logger.debug("sessionId={}\tsessionDidActivate\t{}", session
                    .getId(), se.getSource());
        }
    }

    @Override
    public void valueBound(HttpSessionBindingEvent event) {
        if (logger.isDebugEnabled()) {
            HttpSession session = event.getSession();
            logger.debug("sessionId={}\tvalueBound\t{}={}", new Object[] {
                    session.getId(), event.getName(), event.getValue() });
        }
    }

    @Override
    public void valueUnbound(HttpSessionBindingEvent event) {
        if (logger.isDebugEnabled()) {
            HttpSession session = event.getSession();
            logger.debug("sessionId={}\tvalueUnbound\t{}={}", new Object[] {
                    session.getId(), event.getName(), event.getValue() });
        }
    }

    @Override
    public void attributeAdded(HttpSessionBindingEvent se) {
        if (logger.isDebugEnabled()) {
            HttpSession session = se.getSession();
            logger.debug("sessionId={}\tattributeAdded\t{}={}", new Object[] {
                    session.getId(), se.getName(), se.getValue() });
        }
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent se) {
        if (logger.isDebugEnabled()) {
            HttpSession session = se.getSession();
            logger.debug("sessionId={}\tattributeRemoved\t{}={}", new Object[] {
                    session.getId(), se.getName(), se.getValue() });
        }
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent se) {
        // NO-OP
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        if (logger.isDebugEnabled()) {
            HttpSession session = se.getSession();
            logger.debug("sessionId={}\tsessionCreated\t{}", session.getId(),
                    se.getSource());
        }
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        if (logger.isDebugEnabled()) {
            HttpSession session = se.getSession();
            logger.debug("sessionId={}\tsessionDestroyed\t{}", session.getId(),
                    se.getSource());
        }
    }

}
