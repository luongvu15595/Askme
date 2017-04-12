
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AnswerForQuestion</title>

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
</head>
<body ng-app="AnswerManagement" ng-controller="AnswerController">
 <h1>${question.title}</h1>
 <h2>${question.content}</h2>
 <h2>${question.time}</h2>
 <input type="button" value="Up" ng-click="clickUp()" />
 <input type="button" value="Down" ng-click="clickDown()" />
 <span>{{updown}}</span><br/>
 <h2>Answer : </h2>
 <table >
     <tr ng-repeat=" answer in answers">
         <td>{{answer.content}}</td>
         <td>{{answer.image}}</td>
         <td>{{answer.time | date : 'yyyy/MM/dd' }}</td>

         <td><input type="button" value="Up" ng-click="clickUpAnswer(answer.id)" /></td>
         <td><input type="button" value="Down" ng-click="clickDownAnswer(answer.id)" /></td>

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
        $scope.updown=${vote_question};
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

        $scope.clickDown = function () {
            $scope.updown='-1';
            $http({
                method: 'POST',
                url: 'http://localhost:8080/voteDownQuestion/${question.id_question}'
            })

        }
        $scope.clickUp = function () {
            $scope.updown='+1';
            $http({
                method: 'POST',
                url: 'http://localhost:8080/voteUpQuestion/${question.id_question}'
            })

        }
        $scope.clickUpAnswer = function (id) {
            urlstr = 'http://localhost:8080/voteUpAnswer/' + id;
            $http({
                method: 'POST',
                url: urlstr
            })

        }
        $scope.clickDownAnswer = function (id) {
            urlstr = 'http://localhost:8080/voteDownAnswer/' + id;
            $http({
                method: 'POST',
                url: urlstr
            })

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
           // return _refreshAnswerData();

        };
    })

</script>

</body>
</html>
