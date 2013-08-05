<%@ include file="../common/IncludeTop.jsp"%>

<div id="BackLink">
    <a
        href="${pageContext.request.contextPath}/catalog/viewCategory?categoryId=${f:h(product.categoryId)}">Return
        to ${f:h(product.categoryId)}</a>
</div>

<div id="Catalog">

    <h2>${actionBean.product.name}</h2>

    <table>
        <tr>
            <th>Item ID</th>
            <th>Product ID</th>
            <th>Description</th>
            <th>List Price</th>
            <th>&nbsp;</th>
        </tr>
        <c:forEach var="item" items="${itemList}">
            <tr>
                <td><a
                    href="${pageContext.request.contextPath}/catalog/viewItem?itemId=${f:h(item.itemId)}">
                        ${f:h(item.itemId)} </a></td>
                <td>${f:h(item.product.productId)}</td>
                <td>${f:h(item.attribute1)}${f:h(item.attribute2)}
                    ${f:h(item.attribute3)} ${f:h(item.attribute4)}
                    ${f:h(item.attribute5)} ${f:h(product.name)}</td>
                <td><fmt:formatNumber
                        value="${f:h(item.listPrice)}"
                        pattern="$#,##0.00" /></td>
                <td><a
                    href="${pageContext.request.contextPath}/cart/addItemToCart?workingItemId=${f:h(item.itemId)}">
                        Add to Cart</a></td>
            </tr>
        </c:forEach>
    </table>

</div>

<%@ include file="../common/IncludeBottom.jsp"%>





