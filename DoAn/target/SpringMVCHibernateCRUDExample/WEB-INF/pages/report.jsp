
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Report question</title>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://mbenford.github.io/ngTagsInput/css/ng-tags-input.min.css" />
    <script src="http://mbenford.github.io/ngTagsInput/js/ng-tags-input.min.js"></script>
    <script src="/js/app.js"></script>
</head>
<body ng-app="Askme" ng-controller="ReportController">
    <form ng-submit="submitReport(${idquestion})">
        <div class="col-sm-12 ">  &nbsp; </div>
        <div class="col-sm-12 ">  &nbsp; </div>
        <div class="col-sm-12 ">  &nbsp; </div>
        <div class="col-sm-12 ">  &nbsp; </div>

        <div class="col-sm-12 input">
            <div class="col-sm-3">&nbsp;</div>
            <div class="col-sm-6">
                <textarea type="text" rows="4" class="form-control" ng-model="content" required></textarea>
            </div>
        </div>
        <div class="col-sm-12 ">  &nbsp; </div>

        <div class="col-sm-12 ">
            <div class="col-sm-3">&nbsp;</div>
            <div class="col-sm-3">
                <input type="submit" class="btn btn-primary" value="Submit"/>
            </div>
        </div>
    </form>
</body>
</html>
