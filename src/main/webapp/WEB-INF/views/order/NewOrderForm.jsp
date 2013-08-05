<%@ include file="../common/IncludeTop.jsp"%>

<div id="Catalog">
    <form:form modelAttribute="orderForm"
        action="${pageContext.request.contextPath}/order/newOrder">

        <table>
            <tr>
                <th colspan=2>Payment Details</th>
            </tr>
            <tr>
                <td>Card Type:</td>
                <td><form:select path="cardType"
                        items="${creditCardTypes}">
                    </form:select></td>
            </tr>
            <tr>
                <td>Card Number:</td>
                <td><form:input path="creditCard" /> * Use a fake
                    number!</td>
            </tr>
            <tr>
                <td>Expiry Date (MM/YYYY):</td>
                <td><form:input path="expiryDate" /></td>
            </tr>
            <tr>
                <th colspan=2>Billing Address</th>
            </tr>

            <tr>
                <td>First name:</td>
                <td><form:input path="billToFirstName" /></td>
            </tr>
            <tr>
                <td>Last name:</td>
                <td><form:input path="billToLastName" /></td>
            </tr>
            <tr>
                <td>Address 1:</td>
                <td><form:input size="40" path="billAddress1" /></td>
            </tr>
            <tr>
                <td>Address 2:</td>
                <td><form:input size="40" path="billAddress2" /></td>
            </tr>
            <tr>
                <td>City:</td>
                <td><form:input path="billCity" /></td>
            </tr>
            <tr>
                <td>State:</td>
                <td><form:input size="4" path="billState" /></td>
            </tr>
            <tr>
                <td>Zip:</td>
                <td><form:input size="10" path="billZip" /></td>
            </tr>
            <tr>
                <td>Country:</td>
                <td><form:input size="15" path="billCountry" /></td>
            </tr>

            <tr>
                <td colspan=2><form:checkbox
                        path="shippingAddressRequired" /> Ship to
                    different address...</td>
            </tr>

        </table>
        <form:hidden path="shipToFirstName" />
        <form:hidden path="shipToLastName" />
        <form:hidden path="shipAddress1" />
        <form:hidden path="shipAddress2" />
        <form:hidden path="shipCity" />
        <form:hidden path="shipState" />
        <form:hidden path="shipZip" />
        <form:hidden path="shipCountry" />
        <input type="submit" name="newOrder" value="Continue" />

    </form:form>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>