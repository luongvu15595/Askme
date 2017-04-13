
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AnswerForQuestion</title>

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
</head>
<body ng-app="answerByUser" ng-controller="answerByUserController">
<jsp:include page="header.jsp"/>
<div class="container">
    <table class="table table-striped">
        <tbody>
        <tr ng-repeat="answer in answers">

            <td><h4>{{answer.content}}</h4>
            </td>

        </tr>
        </tbody>
    </table>
</div>



<script type="text/javascript">
    var answerByUser =  angular.module("answerByUser", []);
    answerByUser.controller("answerByUserController",function ($scope,$http) {
        $scope.answers=[];
        _getQuestionByUser();

        function _getQuestionByUser() {
            $http({
                method: 'GET',
                url: 'http://localhost:8080/getAllAnswerByUser/${user.id}'
            }).then(function successCallback(response) {
                $scope.answers = response.data;
            }), function errorCallback(response) {
                console.log(response.statusText);
            }

        }
    })

</script>

</body>
</html>
