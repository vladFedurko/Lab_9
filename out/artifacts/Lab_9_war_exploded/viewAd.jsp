<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8" %>
<%-- Импортировать JSTL-библиотеки --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- Импортировать собственную библиотеку теговых файлов --%>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%-- Импортировать собственную библиотеку тегов --%>
<%@taglib prefix="ad" uri="http://tag/ad" %>
<%-- Получить bean требуемого объявления по переданному параметру id --%>
<ad:getAds id="${param.id}" var="ad" />
<html>
<head>
    <%-- Вывести тему объявления как заголовок страницы --%>
    <title><ad:censor><c:out value="${ad.subject}" /></ad:censor></title>
    <meta http-equiv='Content-Type' content='text/html; charset=UTF8'/>
</head>
<body>
<%-- Подключить заголовок страницы --%>
<jsp:include page="/static/header.jsp"></jsp:include>
<%-- Вставить разметку 1-колоночной страницы --%>
<my:layout1Column>
    <%-- Вывести тему объявления крупными буквами как заголовок
    --%>
    <h1><ad:censor><c:out value="${ad.subject}" /></ad:censor></h1>
    <%-- Вывести служебную информацию об объявлении - кто автор?
    когда изменено? --%>
    <div style="text-decoration: italic; font-size: 10px">
        Автор: <ad:censor><c:out value="${ad.author.name}" /></ad:censor>,
        последняя дата редактирования:
        <fmt:formatDate pattern="hh:mm:ss dd-MM-yyyy"
                        value="${ad.lastModifiedDate}" />
    </div>
    <%-- Отобразить текст объявления в отдельной рамке --%>
    <div style="border: 1px solid black; padding: 20px;">
        <ad:censor>
            <c:out value="${ad.body}" />
        </ad:censor>
    </div>
</my:layout1Column>
<%-- Вставить нижний заголовок страницы --%>
<%@ include file="/static/footer.jsp" %>
</body>
</html>