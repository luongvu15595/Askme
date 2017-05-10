<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/3/2017
  Time: 1:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reports</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
    <link rel="stylesheet" href="http://mbenford.github.io/ngTagsInput/css/ng-tags-input.min.css" />
    <script src="http://mbenford.github.io/ngTagsInput/js/ng-tags-input.min.js"></script>
    <script src="/js/app.js"></script>

</head>
<body ng-app="Askme" >
<jsp:include page="header.jsp"/>
<div class="container" ng-controller="listReports">
    <table class="table table-striped">
        <tbody>
        <tr ng-repeat="report in reports">

            <td>
                <span><a ng-href="/question/{{report.question.id_question}}"><h4>{{report.content}}</h4></a></span>

            </td>

        </tr>
        </tbody>
    </table>
</div>


</body>
</html>
