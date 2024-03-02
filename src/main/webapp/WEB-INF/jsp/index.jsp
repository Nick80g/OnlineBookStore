<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html>
<head>
    <title>Главная</title>
    <style>
        <%@include file="resources/style.css"%>
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body >
<div class="header">
    <a href="#default" class="logo">Online book store</a>
    <div class="header-right">
        <a class="active" href="/">Главная</a>
        <a href="#contact">Контакты</a>
        <a href="#about">О нас</a>
    </div>
</div>
<div class="snippet-container">
    <sec:authorize access="isAuthenticated()">
        <h3 class="snippet-container8">Добро пожаловать <br> ${pageContext.request.userPrincipal.name}</h3>
    </sec:authorize>
    <sec:authorize access="!isAuthenticated()">
        <h4><a href="/login" class="btn btn-lg btn-info">Войти в аккаунт</a></h4>
        <h4><a href="/registration" class="btn btn-lg btn-info">Зарегистрироваться</a></h4>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
        <h4><a href="/logout" class="btn btn-lg btn-info">Выйти из аккаунта</a></h4>
    </sec:authorize>
    <h4><a href="/books" class="btn btn-lg btn-info">Список книг</a></h4>
    <h4><a href="/profile" class="btn btn-lg btn-info">Профиль</a></h4>
<sec:authorize access="hasRole('ADMIN')">
    <h4><a href="/admin" class="btn btn-lg btn-info">Управление коллекцией</a></h4>
</sec:authorize>
</div>
</body>
</html>
