<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
</head>
<body ng-app="Askme" ng-controller="headerController">

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/">ASKME</a>
        </div>
        <form class="navbar-form navbar-left">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
        </form>
        <ul class="nav navbar-nav">
            <li class="active"><a href="/">Home</a></li>
            <li><a href="/createQuestion">Ask</a></li>
            <li><a href="/listoftopic">Topics</a></li>
            <li><a href="/listofuser">Users</a></li>
            <%--<span ng-if="kiemtra == 2">--%>
            <li><a href="/login">login</a></li>
            <li><a href="/registration">registration</a></li>
            <%--</span>--%>
            <%--<span ng-if="kiemtra == 1">--%>
                <%--{{user.name}}--%>
            <%--</span>--%>
        </ul>

    </div>

</nav>
<%--<script type="text/javascript">--%>
    <%--var Askme =  angular.module("Askme", []);--%>
    <%--Askme.controller("headerController",function ($scope,$http) {--%>
        <%--$scope.kiemtra =0;--%>
        <%--checkdangnhap();--%>

        <%--//kiem tra dang nhap--%>
        <%--function checkdangnhap() {--%>
            <%--$http({--%>
                <%--method: 'GET',--%>
                <%--url: 'http://localhost:8080/testthu'--%>
            <%--}).then(function successCallback(response) {--%>
                <%--$scope.kiemtra = response.data;--%>
            <%--}), function errorCallback(response) {--%>
                <%--console.log(response.statusText);--%>
            <%--}--%>
        <%--} ;--%>
    <%--});--%>

<%--</script>--%>
</body>
</html>
