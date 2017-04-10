<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 4/3/2017
  Time: 9:31 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Question</title>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
</head>
<body ng-app="CreateQuestionManagement" ng-controller="CreateQuestionController">

<form ng-submit="submitQuestion()">

    Title : <br>
    <input type="text" ng-model="questionForm.title" required><br>

    Content : <br>
    <input type="text" ng-model="questionForm.content" required><br>

    Image : <br>
    <input type="text" ng-model="questionForm.image"><br>
    <button ng-click="reset()">Reset</button>
    <br>

    <input type="submit" value="Submit"/>


</form>


<script type="text/javascript">
    var CreateQuestionManagement = angular.module("CreateQuestionManagement", []).config(function($httpProvider) {
        $httpProvider.defaults.xsrfCookieName = 'csrftoken';
        $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
    });

    CreateQuestionManagement.controller("CreateQuestionController", function ($scope, $http) {
        $scope.questionForm = {
            title: "",
            content: "",
            image: ""

        };
        $scope.reset = function () {
            $scope.questionForm.title = "";
            $scope.questionForm.content = "";
            $scope.questionForm.image = "";

        };

        $scope.submitQuestion = function () {
            /*     var dataObj = angular.toJson($scope.questionForm);
             $http.post('/createQuestion1', dataObj)
             */
            $http({
                method: "POST",
                url: "/createQuestion",
                data: angular.toJson($scope.questionForm),
                headers: {
                    'Content-Type': 'application/json'
                }
            });//.then( _success, _error );

        };

    })

</script>

</body>
</html>
