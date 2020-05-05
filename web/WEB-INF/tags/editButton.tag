<%@ tag pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="ad" required="true" rtexprvalue="true"
              type="entity.Ad" %>
<%-- Кнопка редактирования показывается только если:
1) пользователь аутентифицирован (authUser!=null);
2) передано текущее объявление (ad!=null);
3) id автора объявленния и id аутентифицированного пользователя
совпадают --%>
<c:if test="${sessionScope.authUser!=null && ad!=null &&
ad.authorId==sessionScope.authUser.id}">
    <div style="float: left; margin: 20px 10px 10px;padding: 5px 0;
border: 1px solid black; background-color: #ccc; width: 150px; textalign: center">
        <a href="<c:url value="/updateAd.jsp">
<c:param name="id" value="${ad.id}" />
</c:url>">Редактировать</a>
    </div>
</c:if>
