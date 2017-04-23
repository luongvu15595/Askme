<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AnswerForQuestion</title>

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="/js/app.js"></script>
</head>
<body ng-app="Askme" ng-controller="searchquestionController">
<jsp:include page="header.jsp"/>
<div class="container">
    <div ng-if="checkquestion == 1">
    <table class="table table-striped">
        <tbody>
        <tr ng-repeat="question in questions">

            <td><a ng-href="/question/{{question.id_question}}"><h4>{{question.title}}</h4></a>
                <br><i>Create by: </i><div class="right"><i>Time:</i></div><br>
                <span>{{question.user.name}}</span>
                <div class="right"><span>{{question.time | date : 'yyyy/MM/dd' }}</span></div>
            </td>

        </tr>
        </tbody>
    </table>
</div>
    <div ng-if="checkquestion == 2">
        khong co ket qua
    </div>
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


    Askme.controller("searchquestionController",function ($scope,$http) {
        $scope.questions=[];
        _getQuestionByUser();
        $scope.checkquestion=0;
        checkquestion1();

        function _getQuestionByUser() {
            $http({
                method: 'GET',
                url: 'http://localhost:8080/listsearchQuestion/${string}'
            }).then(function successCallback(response) {
                $scope.questions = response.data;
            }), function errorCallback(response) {
                console.log(response.statusText);
            }

        }
        function checkquestion1() {
            $http({
                method: 'GET',
                url: 'http://localhost:8080//checksearchQuestion/${string}'
            }).then(function successCallback(response) {
                $scope.checkquestion = response.data;
            }), function errorCallback(response) {
                console.log(response.statusText);
            }
        };
    });

</script>
</body>
</html>
