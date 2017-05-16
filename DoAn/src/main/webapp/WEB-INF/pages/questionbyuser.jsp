
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AnswerForQuestion</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
    <link rel="stylesheet" href="http://mbenford.github.io/ngTagsInput/css/ng-tags-input.min.css" />
    <script src="http://mbenford.github.io/ngTagsInput/js/ng-tags-input.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/angular-ui-bootstrap/0.11.0/ui-bootstrap-tpls.js"></script>
    <script src="/js/dirPagination.js"></script>
    <script src="/js/app.js"></script>

</head>
<body ng-app="Askme" >
<jsp:include page="header.jsp"/>
<div class="container" ng-controller="questionByUserController" ng-init="getQuestionByUser(${user.id})">
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
<jsp:include page="footer.jsp"/>
</body>
</html>
