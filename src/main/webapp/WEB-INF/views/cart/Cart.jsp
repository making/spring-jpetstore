<%@ include file="../common/IncludeTop.jsp"%>

<div id="BackLink">
    <a href="${pageContext.request.contextPath}/catalog"> Return to
        Main Menu</a>
</div>

<div id="Catalog">

    <div id="Cart">

        <h2>Shopping Cart</h2>
        <form:form modelAttribute="cartForm"
            action="${pageContext.request.contextPath}/cart/updateCartQuantities">
            <table>
                <tr>
                    <th><b>Item ID</b></th>
                    <th><b>Product ID</b></th>
                    <th><b>Description</b></th>
                    <th><b>In Stock?</b></th>
                    <th><b>Quantity</b></th>
                    <th><b>List Price</b></th>
                    <th><b>Total Cost</b></th>
                    <th>&nbsp;</th>
                </tr>

                <c:if test="${actionBean.cart.numberOfItems == 0}">
                    <tr>
                        <td colspan="8"><b>Your cart is empty.</b></td>
                    </tr>
                </c:if>

                <c:forEach var="cartItem" items="${cart.cartItems}">
                    <tr>
                        <td><a
                            href="${pageContext.request.contextPath}/catalog/viewItem?itemId=${f:h(cartItem.item.itemId)}">
                                ${f:h(cartItem.item.itemId)}</a></td>
                        <td>${f:h(cartItem.item.product.productId)}</td>
                        <td>${f:h(cartItem.item.attribute1)}
                            ${f:h(cartItem.item.attribute2)}
                            ${f:h(cartItem.item.attribute3)}
                            ${f:h(cartItem.item.attribute4)}
                            ${f:h(cartItem.item.attribute5)}
                            ${f:h(cartItem.item.product.name)}</td>
                        <td>${f:h(cartItem.inStock)}</td>
                        <td><form:input
                                path="quantity[${f:h(cartItem.item.itemId)}]"
                                size="3"
                                value="${f:h(cartItem.quantity)}" /></td>
                        <td><fmt:formatNumber
                                value="${f:h(cartItem.item.listPrice)}"
                                pattern="$#,##0.00" /></td>
                        <td><fmt:formatNumber
                                value="${f:h(cartItem.total)}"
                                pattern="$#,##0.00" /></td>
                        <td><a
                            href="${pageContext.request.contextPath}/cart/removeItemFromCart?cartItem=${f:h(cartItem.item.itemId)}">Remove</a>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="7">Sub Total: <fmt:formatNumber
                            value="${cart.subTotal}" pattern="$#,##0.00" />
                        <input type="submit" value="Update Cart" /></td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </form:form>
        <c:if test="${cart.numberOfItems > 0}">
            <a
                href="${pageContext.request.contextPath}/order/newOrderForm">Proceed
                to Checkout</a>
        </c:if>
    </div>

    <sec:authorize access="isAuthenticated()">
        <sec:authentication property="principal.account" var="account" />
        <div id="MyList">
            <c:if
                test="${account.listOption}">
                <%@ include file="IncludeMyList.jsp"%>
            </c:if>
        </div>
    </sec:authorize>

    <div id="Separator">&nbsp;</div>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>