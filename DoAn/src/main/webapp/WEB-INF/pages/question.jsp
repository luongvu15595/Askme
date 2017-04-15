<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AnswerForQuestion</title>

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        .title{
            font-size: 30px;
        }
        .content{
            margin-top: 5px;
            font-size: 20px;
            border-style: outset;
        }
        .content1{
            margin-top: 20px;

        }
        .createby{
            float: right;
            margin-right: 130px;
        }

        .infor{
            font-size: 12px;
            margin-top: 5px;
        }
        .input{
            margin-top: 30px;
        }
        .text{
            font-size: 15px;
        }
        .contentanswer{
            font-size: 15px;
        }
        .answer{
            margin-top: 15px;
        }
    </style>

</head>
<body ng-app="Askme" ng-controller="AnswerController">
<jsp:include page="header.jsp"/>
<div class="container title">
    <div class="row">
        <div class="col-sm-12">
            <label><b>${question.title}</b></label>
        </div>
        <div class="col-sm-2 content1">
            <button type="button" class="btn-lg">
                <span class="glyphicon glyphicon-thumbs-up" ng-click="clickUp()"></span>
            </button>
            <button type="button" class="btn-lg">
                <span class="glyphicon glyphicon-thumbs-down" ng-click="clickDown()"></span>
            </button>
            <br>
            <div class="text"><b><label>{{DownQuestion}} downvote</label></b> || <b><label>{{upQuestion}} upvote</label></b></div>
        </div>

        <div class="col-sm-10 content contentanswer ">
            <label>${question.content}</label>
        </div>
        <div class="col-sm-12 infor">
            <div class="col-sm-2">&nbsp;</div>
            <label>create By</label><div class="createby"><label>Time</label></div>
            <br>
            <div class="col-sm-2">&nbsp;</div><label>${question.user.name}</label> <div class="createby"><label>${question.time}</label></div>
        </div>

        <div class="col-sm-12 answer"><h2>Answer : </h2></div>
        <div ng-repeat=" answer in answers">
        <div class="col-sm-2 content1">
            <button type="button" class="btn-lg ">
                <span class="glyphicon glyphicon-thumbs-up" ng-click="clickUpAnswer(answer.id)"></span>
            </button>
            <button type="button" class="btn-lg">
                <span class="glyphicon glyphicon-thumbs-down" ng-click="clickDownAnswer(answer.id)"></span>
            </button>
            <br>
            <div class="text"><b><label>{{VoteDownAnswer[answer.id]}} downvote</label></b> || <b><label>{{VoteUpAnswer[answer.id]}} upvote</label></b></div>
        </div>

        <div class="col-sm-10 content contentanswer ">
            <label>{{answer.content}}</label>
        </div>
        <div class="col-sm-12 infor">
            <div class="col-sm-2">&nbsp;</div><label>create By</label><div class="createby"><label>Time</label></div>
            <br>
            <div class="col-sm-2">&nbsp;</div><label>{{answer.user.name}}</label> <div class="createby"><label>{{answer.time | date : 'yyyy/MM/dd' }}</label></div>

        </div>
        </div>
        <div ng-if="kiemtra == 1" >
<form ng-submit="submitAnswer()">
    <div class="col-sm-12 input">
        <div class="col-sm-2">&nbsp;</div>
        <div class="col-sm-8"><textarea type="text" rows="10" class="form-control" ng-model="AnswerForm.content" required></textarea></div>
        <div class="col-sm-2">
        <input type="submit" class="btn btn-primary" value="Submit"/>
        </div>
    </div>
</form>
        </div>
        <div ng-if="kiemtra == 2">
            <div class="col-sm-12 input"> <a href="/login">Moi ban dang nhap</a></div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var Askme =  angular.module("Askme", []);
    Askme.controller("AnswerController",function ($scope,$http) {
        $scope.kiemtra =0;
        checkdangnhap();
        $scope.upQuestion=${up_vote_question};
        $scope.DownQuestion=${down_vote_question};
        $scope.AnswerForm = {
            content: "",
            image: ""
        };
        $scope.answers=[];
        $scope.VoteUpAnswer=[];
        $scope.VoteDownAnswer=[];

        $scope.refreshAnswerData= function () {

            $http({
                method: 'GET',
                url: 'http://localhost:8080/getAllAnswer/${question.id_question}'
            }).then(function successCallback(response) {
                $scope.answers = response.data;
            }), function errorCallback(response) {
                console.log(response.statusText);
            }

        }
        $scope.refreshVoteUpAnswerData= function () {

            $http({
                method: 'GET',
                url: 'http://localhost:8080/getListCountVoteUpAnswer/${question.id_question}'
            }).then(function successCallback(response) {
                $scope.VoteUpAnswer = response.data;
            }), function errorCallback(response) {
                console.log(response.statusText);
            }

        }
        $scope.refreshVoteDownAnswerData= function () {

            $http({
                method: 'GET',
                url: 'http://localhost:8080/getListCountVoteDownAnswer/${question.id_question}'
            }).then(function successCallback(response) {
                $scope.VoteDownAnswer = response.data;
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
        //kiem tra dang nhap
        function checkdangnhap() {
            $http({
                method: 'GET',
                url: 'http://localhost:8080/testthu'
            }).then(function successCallback(response) {
                $scope.kiemtra = response.data;
            }), function errorCallback(response) {
                console.log(response.statusText);
            }
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
            $scope.refreshAnswerData();
        };
        $scope.refreshAnswerData();
        $scope.refreshVoteUpAnswerData();
        $scope.refreshVoteDownAnswerData();
    })

</script>

</body>
</html>
