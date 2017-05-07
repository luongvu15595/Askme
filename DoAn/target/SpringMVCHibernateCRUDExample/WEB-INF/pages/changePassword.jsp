<%--
  Created by IntelliJ IDEA.
  User: Luong-PC
  Date: 5/5/2017
  Time: 2:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://mbenford.github.io/ngTagsInput/css/ng-tags-input.min.css" />
    <script src="http://mbenford.github.io/ngTagsInput/js/ng-tags-input.min.js"></script>
</head>
<body ng-app="Askme" ng-controller="ChangePasswordController">
<label>email</label>
<form ng-submit="postemail">
<input type="text" ng-model="email">
<input type="password" ng-model="newPassword">
<label>nhap lai mat khau</label>
<input type="password" ng-model="renewPassword">
</form>
</body>
</html>
<script>
    var Askme = angular.module("Askme", []);
    Askme.controller("ChangePasswordController",function ($scope, $http){
        $scope.email="";
        $scope.newPassword="";
        $scope.renewPassword="";
        $scope.postemail = function () {
            var fd = new FormData;
            fd.append("email",)
        }


    })
</script>