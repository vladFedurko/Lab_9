<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8" %>
<%-- Импортировать JSTL-библиотеку --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Импортировать собственную библиотеку теговых файлов --%>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%-- Импортировать собственную библиотеку тегов --%>
<%@taglib prefix="ad" uri="http://tag/ad" %>
<html>
<head>
    <title>Регистрация нового пользователя</title>
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
</head>
<body>
<jsp:include page="/static/header.jsp"></jsp:include>
<h1>Регистрация нового пользователя</h1>

<%-- Вставить разметку 2-колоночной страницы --%>
<my:layout2Columns leftColumnWidth="68%" rightColumnWidth="28%">
<jsp:attribute name="leftColumnBody">
<%-- Содержание левой колонки передаѐтся как атрибут leftColumnBody --%>
    <%-- Извлечь список всех объявлений --%>
    <ad:getAds range="all" var="adListing"
               sort="${sessionScope.sort}" dir="${sessionScope.dir}" />
    <%-- Показать объявления без возможности
    редактирования --%>
    <my:adListing adListing="${adListing}"
                  editMode="false" />
</jsp:attribute>
    <jsp:attribute name="rightColumnBody">
<%-- Содержание правой колонки передаѐтся как атрибут
rightColumnBody --%>
        <%-- Вставить тег отображения сообщения об ошибке --%>
        <my:errorMessage />
        <%-- Вставить форму входа --%>
        <form id="form" action="/doRegister.jsp" method="post">
            <table>
                <tr>
                    <td>Логин:</td>
                    <td><input type="text" name="login" value="${sessionScope.userData.login}"></td>
                </tr>
                <tr>
                    <td>Пароль:</td>
                    <td><input type="password" name="password" value=""></td>
                </tr>
                <tr>
                    <td>Имя:</td>
                    <td><input type="text" name="name" value="${sessionScope.userData.name}"></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="text" name="email" value="${sessionScope.userData.email}"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Зарегистрироваться"> <input
                            type="button" value="Отменить"
                            onclick="window.location='<c:url value="/index.jsp"/>';"></td>
                </tr>
            </table>
        </form>
</jsp:attribute>
</my:layout2Columns>
<%-- Вставить нижний заголовок страницы --%>
<%@ include file="/static/footer.jsp" %>
</body>
</html>