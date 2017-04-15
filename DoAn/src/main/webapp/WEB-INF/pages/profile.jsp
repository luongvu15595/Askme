<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>List Question</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>

    <style>

        .right{
            float: right;
        }
        .center{
            margin-top: 5px;
        }
    </style>
</head>
<body ng-app="Askme" ng-controller="profile">
<jsp:include page="header.jsp"/>
<h1>${user.name}</h1>
<h2><a href="/${user.id}/question">Questions(${question})</a></h2>
<h2><a href="/${user.id}/answer">Answers(${answer})</a></h2>

<script>
    var Askme =  angular.module("Askme", []);
    Askme.controller("profile",function () {
    })
</script>
</body>
</html>
