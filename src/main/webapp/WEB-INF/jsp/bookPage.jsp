<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html>
<head>
    <title>${book.name}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
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
    <h1>Название  : ${book.name}</h1>
    <h2>Описание : ${book.description}</h2>
    <h2>Цена : ${book.price}</h2>
</div>
</body>
</html>
