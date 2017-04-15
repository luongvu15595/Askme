
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AnswerForQuestion</title>

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
</head>
<body ng-app="Askme" ng-controller="questionByUserController">
<jsp:include page="header.jsp"/>
<div class="container">
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



<script type="text/javascript">
    var Askme =  angular.module("Askme", []);
    Askme.controller("questionByUserController",function ($scope,$http) {
        $scope.questions=[];
        _getQuestionByUser();

        function _getQuestionByUser() {
            $http({
                method: 'GET',
                url: 'http://localhost:8080/getAllQuestionByUser/${user.id}'
            }).then(function successCallback(response) {
                $scope.questions = response.data;
            }), function errorCallback(response) {
                console.log(response.statusText);
            }

        }
    })

</script>

</body>
</html>
