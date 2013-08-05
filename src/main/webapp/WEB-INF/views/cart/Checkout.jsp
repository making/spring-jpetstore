<%@ include file="../common/IncludeTop.jsp"%>

<div id="BackLink">
    <a href="${pageContext.request.contextPath}/cart/viewCart">
        Return to Shopping Cart</a>
</div>

<div id="Catalog">
    <table>
        <tr>
            <td>
                <h2>Checkout Summary</h2>

                <table>

                    <tr>
                        <td><b>Item ID</b></td>
                        <td><b>Product ID</b></td>
                        <td><b>Description</b></td>
                        <td><b>In Stock?</b></td>
                        <td><b>Quantity</b></td>
                        <td><b>List Price</b></td>
                        <td><b>Total Cost</b></td>
                    </tr>

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
                            <td>${f:h(cartItem.quantity)}</td>
                            <td><fmt:formatNumber
                                    value="${f:h(cartItem.item.listPrice)}"
                                    pattern="$#,##0.00" /></td>
                            <td><fmt:formatNumber
                                    value="${f:h(cartItem.total)}"
                                    pattern="$#,##0.00" /></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="7">Sub Total: <fmt:formatNumber
                                value="${f:h(cart.subTotal)}"
                                pattern="$#,##0.00" /></td>
                    </tr>
                </table>
            <td>&nbsp;</td>

        </tr>
    </table>

</div>

<%@ include file="../common/IncludeBottom.jsp"%>