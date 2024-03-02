<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        <%@include file="resources/style.css"%>
    </style>
    <meta charset="utf-8">
    <title>Управление коллекцией</title>
</head>

<body>
<div class="header">
    <a href="#default" class="logo">Online book store</a>
    <div class="header-right">
        <a class="active" href="/">Главная</a>
        <a href="#contact">Контакты</a>
        <a href="#about">О нас</a>
    </div>
</div>
<div class="snippet-container7">
    <table>
        <thead>
        <th>Название</th>
        <th>Жанр</th>
        <th>Цена</th>
        </thead>
        <c:forEach items="${allBooks}" var="book">
            <tr>
                <td>${book.name}</td>
                <td>${book.description}</td>
                <td>${book.price}</td>
                <td>
                    <form action="${pageContext.request.contextPath}/admin" method="post">
                        <input type="hidden" name="bookName" value="${book.name}"/>
                        <input type="hidden" name="action" value="delete"/>
                        <button type="submit" class="btn btn-lg btn-info">Удалить</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>