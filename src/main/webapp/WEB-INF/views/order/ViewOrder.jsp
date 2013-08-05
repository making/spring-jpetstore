<%@ include file="../common/IncludeTop.jsp"%>

<div id="BackLink">
    <a href="${pageContext.request.contextPath}/catalog"> Return to
        Main Menu</a>
</div>

<div id="Catalog">

    <table>
        <tr>
            <th align="center" colspan="2">Order #${order.orderId}
                <fmt:formatDate value="${order.orderDate}"
                    pattern="yyyy/MM/dd hh:mm:ss" />
            </th>
        </tr>
        <tr>
            <th colspan="2">Payment Details</th>
        </tr>
        <tr>
            <td>Card Type:</td>
            <td>${f:h(order.cardType)}</td>
        </tr>
        <tr>
            <td>Card Number:</td>
            <td>${f:h(order.creditCard)}*Fakenumber!</td>
        </tr>
        <tr>
            <td>Expiry Date (MM/YYYY):</td>
            <td>${f:h(order.expiryDate)}</td>
        </tr>
        <tr>
            <th colspan="2">Billing Address</th>
        </tr>
        <tr>
            <td>First name:</td>
            <td>${f:h(order.billToFirstName)}</td>
        </tr>
        <tr>
            <td>Last name:</td>
            <td>${f:h(order.billToLastName)}</td>
        </tr>
        <tr>
            <td>Address 1:</td>
            <td>${f:h(order.billAddress1)}</td>
        </tr>
        <tr>
            <td>Address 2:</td>
            <td>${f:h(order.billAddress2)}</td>
        </tr>
        <tr>
            <td>City:</td>
            <td>${f:h(order.billCity)}</td>
        </tr>
        <tr>
            <td>State:</td>
            <td>${f:h(order.billState)}</td>
        </tr>
        <tr>
            <td>Zip:</td>
            <td>${f:h(order.billZip)}</td>
        </tr>
        <tr>
            <td>Country:</td>
            <td>${f:h(order.billCountry)}</td>
        </tr>
        <tr>
            <th colspan="2">Shipping Address</th>
        </tr>
        <tr>
            <td>First name:</td>
            <td>${f:h(order.shipToFirstName)}</td>
        </tr>
        <tr>
            <td>Last name:</td>
            <td>${f:h(order.shipToLastName)}</td>
        </tr>
        <tr>
            <td>Address 1:</td>
            <td>${f:h(order.shipAddress1)}</td>
        </tr>
        <tr>
            <td>Address 2:</td>
            <td>${f:h(order.shipAddress2)}</td>
        </tr>
        <tr>
            <td>City:</td>
            <td>${f:h(order.shipCity)}</td>
        </tr>
        <tr>
            <td>State:</td>
            <td>${f:h(order.shipState)}</td>
        </tr>
        <tr>
            <td>Zip:</td>
            <td>${f:h(order.shipZip)}</td>
        </tr>
        <tr>
            <td>Country:</td>
            <td>${f:h(order.shipCountry)}</td>
        </tr>
        <tr>
            <td>Courier:</td>
            <td>${f:h(order.courier)}</td>
        </tr>
        <tr>
            <td colspan="2">Status: ${f:h(order.status)}</td>
        </tr>
        <tr>
            <td colspan="2">
                <table>
                    <tr>
                        <th>Item ID</th>
                        <th>Description</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total Cost</th>
                    </tr>
                    <c:forEach var="lineItem" items="${order.lineItems}">
                        <tr>
                            <td><a
                                href="${pageContext.request.contextPath}/catalog/viewItem?itemId=${f:h(lineItem.item.itemId)}">
                                    ${f:h(lineItem.item.itemId)} </a></td>
                            <td><c:if
                                    test="${lineItem.item != null}">
                        ${f:h(lineItem.item.attribute1)}
                        ${f:h(lineItem.item.attribute2)}
                        ${f:h(lineItem.item.attribute3)}
                        ${f:h(lineItem.item.attribute4)}
                        ${f:h(lineItem.item.attribute5)}
                        ${f:h(lineItem.item.product.name)}
                    </c:if> <c:if test="${lineItem.item == null}">
                                    <i>{description unavailable}</i>
                                </c:if></td>

                            <td>${f:h(lineItem.quantity)}</td>
                            <td><fmt:formatNumber
                                    value="${f:h(lineItem.unitPrice)}"
                                    pattern="$#,##0.00" /></td>
                            <td><fmt:formatNumber
                                    value="${f:h(lineItem.total)}"
                                    pattern="$#,##0.00" /></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <th colspan="5">Total: <fmt:formatNumber
                                value="${f:h(order.totalPrice)}"
                                pattern="$#,##0.00" /></th>
                    </tr>
                </table>
            </td>
        </tr>

    </table>

</div>

<%@ include file="../common/IncludeBottom.jsp"%>
