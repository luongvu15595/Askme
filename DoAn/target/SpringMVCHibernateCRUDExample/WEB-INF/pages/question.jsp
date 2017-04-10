<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AnswerForQuestion</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
</head>
<body ng-app="AnswerManagement" ng-controller="AnswerController">
<jsp:include page="header.jsp"/>
 <h1>${question.title}</h1>
 <h2>${question.content}</h2>
 <h2>${question.time}</h2>
 <h2>Answer : </h2>
 <table >
     <tr ng-repeat=" answer in answers">
         <td>{{answer.content}}</td>
         <td>{{answer.image}}</td>
         <td>{{answer.time | date : 'yyyy/MM/dd' }}</td>
         <td></td>
     </tr>
 </table>
 <form ng-submit="submitAnswer()">

     Content : <br>
     <input type="text" ng-model="AnswerForm.content" required><br>

     Image : <br>
     <input type="text" ng-model="AnswerForm.image"><br>

     <input type="submit" value="Submit"/>

 </form>

<script type="text/javascript">
    var AnswerManagement =  angular.module("AnswerManagement", []);
    AnswerManagement.controller("AnswerController",function ($scope,$http) {
        $scope.AnswerForm = {
            content: "",
            image: ""
        };
        $scope.answers=[];
        _refreshAnswerData();

        function _refreshAnswerData() {
            $http({
                method: 'GET',
                url: 'http://localhost:8080/getAllAnswer/${question.id_question}'
            }).then(function successCallback(response) {
                $scope.answers = response.data;
            }), function errorCallback(response) {
                console.log(response.statusText);
            }

        }

        $scope.submitAnswer = function () {

            $http({
                method: "POST",
                url: "/createAnswer/${question.id_question}",
                data: angular.toJson($scope.AnswerForm),
                headers: {
                    'Content-Type': 'application/json'
                }
            });//.then( _success, _error );

        };
    })

</script>

</body>
</html>
