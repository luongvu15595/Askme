<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AnswerForQuestion</title>
    <link rel="stylesheet" href="http://mbenford.github.io/ngTagsInput/css/ng-tags-input.min.css" />
    <script src="http://mbenford.github.io/ngTagsInput/js/ng-tags-input.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/angular-ui-bootstrap/0.11.0/ui-bootstrap-tpls.js"></script>
    <script src="/js/app.js"></script>
</head>
<body ng-app="Askme" ng-controller="answerByUserController">
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
</body>
</html>
