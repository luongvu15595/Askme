<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create Question</title>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://mbenford.github.io/ngTagsInput/css/ng-tags-input.min.css" />
    <script src="http://mbenford.github.io/ngTagsInput/js/ng-tags-input.min.js"></script>
    <script src="/js/app.js"></script>
    <style type="text/css">
        .top{
            margin-top: 10px;
        }
    </style>
</head>
<body ng-app="Askme" ng-controller="editQuestionController">
<jsp:include page="header.jsp"/>
<div class="container">
    <form ng-submit="submitUpdateQuestion()">
        <div class="row">
            <h1>${questionFormUpdate.content}</h1>
            <input type="hidden" ng-model="questionForm.id_question">
            <div class="form-group col-sm-10 top ">
                <span class="col-sm-1"><label >Title:</label></span>
                <span class="col-sm-9"><input type="text" class="form-control" ng-model="questionForm.title" ></span>
            </div>

            <div class="form-group col-sm-10">
                <span class="col-sm-1"><label>Content:</label></span>
                <span class="col-sm-9"><textarea type="text" rows="10" class="form-control" ng-model="questionForm.content" required></textarea></span>
            </div>

            <div class="form-group col-sm-10">
                <span class="col-sm-1"><label>Browse:</label></span>
                <span class="col-sm-9"><input type="file" ng-model="questionForm.image" hidden></span>
            </div>

            <div class="form-group col-sm-10">
                <span class="col-sm-7">&nbsp;</span>
                <span class="col-sm-3"><input type="submit" class="btn btn-lg btn-primary btn-block" value="Submit"/></span>
            </div>
        </div>
    </form>
</div>
</body>
</html>
