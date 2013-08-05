<%@ include file="../common/IncludeTop.jsp"%>

<div id="BackLink">
    <a href="${pageContext.request.contextPath}/catalog"> Return to
        Main Menu</a>
</div>

<div id="Catalog">
    Please confirm the information below and then press continue...
    <form:form modelAttribute="orderForm"
        action="${pageContext.request.contextPath}/order/newOrder">
        <table>
            <tr>
                <th align="center" colspan="2"><font size="4"><b>Order</b></font>
                    <br /> <font size="3"><b> <fmt:formatDate
                                value="${order.orderDate}"
                                pattern="yyyy/MM/dd hh:mm:ss" /></b></font></th>
            </tr>

            <tr>
                <th colspan="2">Billing Address</th>
            </tr>
            <tr>
                <td>First name:</td>
                <td>${f:h(orderForm.billToFirstName)}<form:hidden
                        path="billToFirstName" /></td>
            </tr>
            <tr>
                <td>Last name:</td>
                <td>${f:h(orderForm.billToLastName)}<form:hidden
                        path="billToLastName" /></td>
            </tr>
            <tr>
                <td>Address 1:</td>
                <td>${f:h(orderForm.billAddress1)}<form:hidden
                        path="billAddress1" /></td>
            </tr>
            <tr>
                <td>Address 2:</td>
                <td>${f:h(orderForm.billAddress2)}<form:hidden
                        path="billAddress2" /></td>
            </tr>
            <tr>
                <td>City:</td>
                <td>${f:h(orderForm.billCity)}<form:hidden
                        path="billCity" /></td>
            </tr>
            <tr>
                <td>State:</td>
                <td>${f:h(orderForm.billState)}<form:hidden
                        path="billState" /></td>
            </tr>
            <tr>
                <td>Zip:</td>
                <td>${f:h(orderForm.billZip)}<form:hidden
                        path="billZip" /></td>
            </tr>
            <tr>
                <td>Country:</td>
                <td>${f:h(orderForm.billCountry)}<form:hidden
                        path="billCountry" /></td>
            </tr>
            <tr>
                <th colspan="2">Shipping Address</th>
            </tr>
            <tr>
                <td>First name:</td>
                <td>${f:h(orderForm.shipToFirstName)}<form:hidden
                        path="shipToFirstName" /></td>
            </tr>
            <tr>
                <td>Last name:</td>
                <td>${f:h(orderForm.shipToLastName)}<form:hidden
                        path="shipToLastName" />
                </td>
            </tr>
            <tr>
                <td>Address 1:</td>
                <td>${f:h(orderForm.shipAddress1)}<form:hidden
                        path="shipAddress1" /></td>
            </tr>
            <tr>
                <td>Address 2:</td>
                <td>${f:h(orderForm.shipAddress2)}<form:hidden
                        path="shipAddress2" /></td>
            </tr>
            <tr>
                <td>City:</td>
                <td>${f:h(orderForm.shipCity)}<form:hidden
                        path="shipCity" /></td>
            </tr>
            <tr>
                <td>State:</td>
                <td>${f:h(orderForm.shipState)}<form:hidden
                        path="shipState" /></td>
            </tr>
            <tr>
                <td>Zip:</td>
                <td>${f:h(orderForm.shipZip)}<form:hidden
                        path="shipZip" /></td>
            </tr>
            <tr>
                <td>Country:</td>
                <td>${f:h(orderForm.shipCountry)}<form:hidden
                        path="shipCountry" /></td>
            </tr>

        </table>
        <form:hidden path="cardType" />
        <form:hidden path="creditCard" />
        <form:hidden path="expiryDate" />
        <input type="hidden" name="confirmed" value="true" />
        <input type="submit" value="Confirm">
    </form:form>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>





