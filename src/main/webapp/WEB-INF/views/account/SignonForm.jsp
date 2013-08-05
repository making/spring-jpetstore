<%@ include file="../common/IncludeTop.jsp"%>

<div id="Catalog">
    <c:if test="${not empty param.error}">
        <div class="alert alert-error">
            <h4 class="alert-heading">Login error!</h4>
            ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
        </div>
    </c:if>
    <form action='${pageContext.request.contextPath}/account/signon'
        method="POST">

        <p>Please enter your username and password.</p>
        <p>
            Username: <input type='text' name='j_username' value='j2ee'>
            <br /> Password: <input type='password' name='j_password'
                value="j2ee" />
        </p>
        <input name="submit" type="submit" value="Login" />
    </form>
    Need a user name and password? <a
        href="${pageContext.request.contextPath}/account/newAccountForm">Register
        Now!</a>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>

