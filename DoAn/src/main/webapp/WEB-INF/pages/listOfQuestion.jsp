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
<body ng-app="QuestionManagement" ng-controller="QuestionController">
<jsp:include page="header.jsp"/>
<div class="container">
    <table class="table table-striped">
        <tbody>
        <tr ng-repeat="(question_id,number) in properties">
            <td> {{number}}
                <br>
                <b>Answer</b>
            </td>

            <td><a ng-href="/question/{{questions[$index].id_question}}"><h4>{{questions[$index].title}}</h4></a>
                <br><i>Create by: </i><div class="right"><i>Time:</i></div><br>
                <span>{{questions[$index].user.name}}</span>
                <div class="right"><span>{{questions[$index].time | date : 'yyyy/MM/dd' }}</span></div>
            </td>

        </tr>
        </tbody>
    </table>
</div>


<script type="text/javascript">
    var QuestionManagement = angular.module("QuestionManagement", []);

    QuestionManagement.controller("QuestionController", function ($scope, $http) {
        $scope.questions = [];
        _refreshQuestionData();
        function _refreshQuestionData() {
            $http({
                method: 'GET',
                url: 'http://localhost:8080/getAllQuestion'
            }).then(function successCallback(response) {
                $scope.questions = response.data;
            }), function errorCallback(response) {
                console.log(response.statusText);
            }
        }
        var req = {
            method: 'GET',
            url: 'http://localhost:8080/getcount'};
        $http(req).success(
            function (data) {
                $scope.properties = data;
            }
        );
    });
</script>

</body>
</html>
