<%@ include file="../common/IncludeTop.jsp"%>

<div id="Welcome">
    <div id="WelcomeContent">
        <c:if test="${sessionScope.accountBean != null }">
            <c:if test="${sessionScope.accountBean.authenticated}">
        Welcome ${sessionScope.accountBean.account.firstName}!
      </c:if>
        </c:if>
    </div>
</div>

<div id="Main">
    <div id="Sidebar">
        <div id="SidebarContent">
            <a
                href="${pageContext.request.contextPath}/catalog/viewCategory?categoryId=FISH"><img
                src="${pageContext.request.contextPath}/resources/images/fish_icon.gif" />
            </a> <br /> Saltwater, Freshwater <br /> <a
                href="${pageContext.request.contextPath}/catalog/viewCategory?categoryId=DOGS"><img
                src="${pageContext.request.contextPath}/resources/images/dogs_icon.gif" />
            </a> <br /> Various Breeds <br /> <a
                href="${pageContext.request.contextPath}/catalog/viewCategory?categoryId=CATS"><img
                src="${pageContext.request.contextPath}/resources/images/cats_icon.gif" />
            </a> <br /> Various Breeds, Exotic Varieties <br /> <a
                href="${pageContext.request.contextPath}/catalog/viewCategory?categoryId=REPTILES"><img
                src="${pageContext.request.contextPath}/resources/images/reptiles_icon.gif" />
            </a> <br /> Lizards, Turtles, Snakes <br /> <a
                href="${pageContext.request.contextPath}/catalog/viewCategory?categoryId=BIRDS"><img
                src="${pageContext.request.contextPath}/resources/images/birds_icon.gif" />
            </a> <br /> Exotic Varieties
        </div>
    </div>

    <div id="MainImage">
        <div id="MainImageContent">
            <map name="estoremap">
                <area alt="Birds" coords="72,2,280,250"
                    href="${pageContext.request.contextPath}/catalog/viewCategory?categoryId=BIRDS"
                    shape="RECT" />
                <area alt="Fish" coords="2,180,72,250"
                    href="${pageContext.request.contextPath}/catalog/viewCategory?categoryId=FISH"
                    shape="RECT" />
                <area alt="Dogs" coords="60,250,130,320"
                    href="${pageContext.request.contextPath}/catalog/viewCategory?categoryId=DOGS"
                    shape="RECT" />
                <area alt="Reptiles" coords="140,270,210,340"
                    href="${pageContext.request.contextPath}/catalog/viewCategory?categoryId=REPTILES"
                    shape="RECT" />
                <area alt="Cats" coords="225,240,295,310"
                    href="${pageContext.request.contextPath}/catalog/viewCategory?categoryId=CATS"
                    shape="RECT" />
                <area alt="Birds" coords="280,180,350,250"
                    href="${pageContext.request.contextPath}/catalog/viewCategory?categoryId=BIRDS"
                    shape="RECT" />
            </map>
            <img height="355"
                src="${pageContext.request.contextPath}/resources/images/splash.gif"
                align="middle" usemap="#estoremap" width="350" />
        </div>
    </div>

    <div id="Separator">&nbsp;</div>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>