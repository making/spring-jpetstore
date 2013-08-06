<%@ include file="../common/IncludeTop.jsp"%>

<h2>My Orders</h2>

<table>
    <tr>
        <th>Order ID</th>
        <th>Date</th>
        <th>Total Price</th>
    </tr>

    <c:forEach var="order" items="${orderList}">
        <tr>
            <td><a
                href="${pageContext.request.contextPath}/order/viewOrder?orderId=${f:h(order.orderId)}">${f:h(order.orderId)}</a></td>
            <td><fmt:formatDate value="${order.orderDate}"
                    pattern="yyyy/MM/dd hh:mm:ss" /></td>
            <td><fmt:formatNumber value="${f:h(order.totalPrice)}"
                    pattern="$#,##0.00" /></td>
        </tr>
    </c:forEach>
</table>

<%@ include file="../common/IncludeBottom.jsp"%>


