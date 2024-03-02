<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Профиль</title>
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
<div class="snippet-container">
    <h1>${user.name}</h1>
    <h2>Ваш счет : ${user.wallet}</h2>
    <h2>Ваши книги</h2>
</div>
<div class="snippet-container7">
    <table>
        <thead>
        <th>Название</th>
        <th>Описание</th>
        <th>Цена</th>
        </thead>
        <c:forEach items="${userBooks}" var="book">
            <tr>
                <td>${book.name}</td>
                <td>${book.description}</td>
                <td>${book.price}</td>
                <td><button type="submit" class="btn btn-lg btn-info">Читать</button></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
