<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Список книг</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        <%@include file="resources/style.css"%>
    </style>
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
<div class="snippet-container6">
    <table class="snippet-container7">
        <thead>
        <th><h4>Название</h4></th>
        <th><h4>Жанр</h4></th>
        <th><h4>Цена</h4></th>
        </thead>
        <c:forEach items="${allBooks}" var="book">
            <tr>
                <td><a href="bookPage?bookName=${book.name}">${book.name}</a></td>
                <td>${book.description}</td>
                <td>${book.price}</td>
                <td>
                    <form action="${pageContext.request.contextPath}/books" method="POST" >
                        <input type="hidden" name="bookName" value="${book.name}"/>
                        <input type="hidden" name="action" value="buy"/>
                        <button type="submit" class="btn btn-lg btn-info">Купить</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>