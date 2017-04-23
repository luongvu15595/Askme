<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns:th="http://www.thymeleaf.org">
<head>

    <title>List User</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
    <script src="/js/app.js"></script>

    <style>

        .right{
            float: right;
        }
        .center{
            margin-top: 5px;
        }
    </style>
</head>
<body ng-app="Askme" ng-controller="listUser">
<jsp:include page="header.jsp"/>
<div class="container">
    <table class="table table-striped">
        <tbody>
        <tr ng-repeat="user in users">
            <td><a ng-href="/{{user.id}}"><h4>{{user.name}}</h4></a>
            </td>

        </tr>
        </tbody>
    </table>
</div>
<script>
    var Askme = angular.module("Askme", []);

    Askme.controller("headerController", function ($scope, $http) {
        $scope.kiemtra = 0;
        $scope.user = "";
        $scope.headerForm = {
            search: ""
        };
        checkdangnhap();
        test();

        //kiem tra dang nhap
        function checkdangnhap() {
            $http({
                method: 'GET',
                url: 'http://localhost:8080/testthu'
            }).then(function successCallback(response) {
                $scope.kiemtra = response.data;
            }), function errorCallback(response) {
                console.log(response.statusText);
            }
        };
        function test() {
            $http({
                method: 'GET',
                url: 'http://localhost:8080/testabc'
            }).then(function successCallback(response) {
                $scope.user = response.data;
            }), function errorCallback(response) {
                console.log(response.statusText);
            }
        };
        $scope.submitSearch = function () {
            var name = "/search/" + $scope.headerForm.search;
            location.href = name;
        };


    });

    Askme.controller("listUser", function ($scope, $http) {
        $scope.users = [];

        _refreshQuestionData();

        function _refreshQuestionData() {
            $http({
                method: 'GET',
                url: 'http://localhost:8080/listUser'
            }).then(function successCallback(response) {
                $scope.users = response.data;
            }), function errorCallback(response) {
                console.log(response.statusText);
            }
        }

    });
</script>
</body>
</html>
