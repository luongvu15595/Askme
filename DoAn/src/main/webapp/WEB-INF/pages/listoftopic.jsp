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
    <link rel="stylesheet" href="http://mbenford.github.io/ngTagsInput/css/ng-tags-input.min.css" />
    <script src="http://mbenford.github.io/ngTagsInput/js/ng-tags-input.min.js"></script>
    <script src="/js/app.js"></script>

    <style>

        .right{
            font-size: 20px;
            margin-top: 15px;
        }
        .right1{
            font-size: 20px;
            margin-top: 25px;
        }

        .hr{
            border-top: 1px solid #ccc;
            margin-top: 35px;
        }
</style>
</head>
<body ng-app="Askme" ng-controller="listOfTopicController">
<jsp:include page="header.jsp"/>
<div class="container">
    <div class="row" >
        <div class="col-sm-12">
            <span class=" col-sm-4 " ng-repeat="topic in topics">
                <div class="hr"></div>
                <div ><a ng-href="/topic/{{topic.id}}"><button class="btn btn-info right">{{topic.name}}</button></a>
                <span class="right1"> x {{countquestionbytopics[topic.id]}}</span></div >
            </span>
        </div>
    </div>

</div>
</body>
</html>
