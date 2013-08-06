<%@ include file="../common/IncludeTop.jsp"%>

<div id="Catalog">
    <form:form modelAttribute="accountForm"
        action="${pageContext.request.contextPath}/account/editAccount">

        <h3>User Information</h3>

        <table>
            <tr>
                <td>User ID:</td>
                <td>${f:h(accountForm.username)}</td>
            </tr>
            <tr>
                <td>New password:</td>
                <td><form:password path="password" /> <form:errors path="password" /></td>
            </tr>
            <tr>
                <td>Repeat password:</td>
                <td><form:password path="repeatedPassword" /> <form:errors path="repeatedPassword" /></td>
            </tr>
        </table>
        <%@ include file="IncludeAccountFields.jsp"%>

        <input type="submit" name="editAccount"
            value="Save Account Information" />

    </form:form>
    <a href="${pageContext.request.contextPath}/order/listOrders">My
        Orders</a>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>
