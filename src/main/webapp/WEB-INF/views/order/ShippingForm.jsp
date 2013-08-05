<%@ include file="../common/IncludeTop.jsp"%>

<div id="Catalog">
    <form:form modelAttribute="orderForm"
        action="${pageContext.request.contextPath}/order/newOrder">

        <table>
            <tr>
                <th colspan=2>Shipping Address</th>
            </tr>

            <tr>
                <td>First name:</td>
                <td><form:input path="shipToFirstName" /></td>
            </tr>
            <tr>
                <td>Last name:</td>
                <td><form:input path="shipToLastName" /></td>
            </tr>
            <tr>
                <td>Address 1:</td>
                <td><form:input size="40" path="shipAddress1" /></td>
            </tr>
            <tr>
                <td>Address 2:</td>
                <td><form:input size="40" path="shipAddress2" /></td>
            </tr>
            <tr>
                <td>City:</td>
                <td><form:input path="shipCity" /></td>
            </tr>
            <tr>
                <td>State:</td>
                <td><form:input size="4" path="shipState" /></td>
            </tr>
            <tr>
                <td>Zip:</td>
                <td><form:input size="10" path="shipZip" /></td>
            </tr>
            <tr>
                <td>Country:</td>
                <td><form:input size="15" path="shipCountry" /></td>
            </tr>
        </table>
        <form:hidden path="cardType" />
        <form:hidden path="creditCard" />
        <form:hidden path="expiryDate" />
        <form:hidden path="billToFirstName" />
        <form:hidden path="billToLastName" />
        <form:hidden path="billAddress1" />
        <form:hidden path="billAddress2" />
        <form:hidden path="billCity" />
        <form:hidden path="billState" />
        <form:hidden path="billZip" />
        <form:hidden path="billCountry" />
        <input type="submit" name="newOrder" value="Continue" />
    </form:form>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>