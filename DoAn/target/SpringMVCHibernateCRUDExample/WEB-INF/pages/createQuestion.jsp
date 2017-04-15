<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Question</title>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        .top{
            margin-top: 10px;
        }
    </style>
</head>
<body ng-app="Askme" ng-controller="CreateQuestionController">
<jsp:include page="header.jsp"/>
<div class="container">
    <form ng-submit="submitQuestion()">
        <div class="row">
            <div class="form-group col-sm-10 top ">
                <span class="col-sm-1"><label >Title:</label></span>
                <span class="col-sm-9"><input type="text" class="form-control" ng-model="questionForm.title" required></span>
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
                <span class="col-sm-1"><label >Add Topic:</label></span>
                <span class="col-sm-9"><input type="text" class="form-control" ng-model="tagForm.name"></span>
            </div>

            <div class="form-group col-sm-10">
                <span class="col-sm-7">&nbsp;</span>
                <span class="col-sm-3"><input type="submit" class="btn btn-lg btn-primary btn-block" value="Submit"/></span>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
    var Askme = angular.module("Askme", []);
    Askme.controller("CreateQuestionController", function ($scope, $http) {
        $scope.questionForm = {
            title: "",
            content: "",
            image: ""

        };
        $scope.tagForm = {
            name: ""
        };
        $scope.reset = function () {
            $scope.questionForm.title = "";
            $scope.questionForm.content = "";
            $scope.questionForm.image = "";

        };

        $scope.submitQuestion = function () {
            /*     var dataObj = angular.toJson($scope.questionForm);
             $http.post('/createQuestion1', dataObj)
             */
            var name = "/createQuestion/" + $scope.tagForm.name;
            $http({
                method: "POST",
                url: name,
                data: angular.toJson($scope.questionForm),
                headers: {
                    'Content-Type': 'application/json'
                }
            });

        };

    })

</script>
</body>
</html>
