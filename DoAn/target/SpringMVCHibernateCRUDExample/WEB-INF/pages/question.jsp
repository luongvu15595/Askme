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
        .title {
            font-size: 30px;
            margin-top: 1em;
            text-align: justify;
        }

        .content {
            margin-top: 15px;
            font-size: 15px;
            border: solid 2px #ccc;
            border-radius: 10px;
            padding: 15px;
            margin-left: 10px;
        }
        .updown{
            margin-top: 10px;
        }

        .createby {
            float: right;
            margin-right: 130px;
        }

        .infor {
            font-size: 15px;
            margin-top: 5px;
        }

        .infor1 {
            font-size: 15px;
            margin-top: 5px;
        }

        .input {
            margin-top: 30px;
        }

        .text {
            font-size: 13px;
            margin-top: 3px;
        }

        .contentanswer {
            font-size: 15px;
            padding:15px;
        }

        .answer {
            margin-top: 15px;
        }

        .answertext{
            margin-top: 1em;
            margin-bottom: 0.5em;
        }

        .hr{
            border-top: 1px solid #ccc;
            margin-top: 35px;
            margin-left: 15px;
        }

        .hr1{
            border-top: 1px solid #ccc;
            margin-left: 15px;
        }

        .comment{
            margin-bottom: 1em;
        }
        .login{
            margin-bottom: 1em;
            margin-top: 30px;
        }
        .inforanswer{
            font-size: 15px;
        }
    </style>

</head>
<body ng-app="Askme" ng-controller="AnswerController">
<jsp:include page="header.jsp"/>
<div class="container title">
    <div class="row">
        <div class="col-sm-12">
            <div class="col-sm-2"></div>
            <div class="col-sm-9"><label class="title1">
                <b>${question.title}</b></label>
            </div>
        </div>
        <div class="col-sm-12 infor">
            <div class="col-sm-2"></div>
            <div class="col-sm-10"><label><i><a href="/${question.user.id}">${question.user.name}</a></i></label>
                <label><i>, ${question.time}</i></label>
            </div>
        </div>
        <div class="col-sm-12">
            <div class="col-sm-2 updown">
                <div ng-if="votedUp == 1">
                    <button type="button" class="btn btn-success" ng-click="clickUp()">
                        &nbsp; &nbsp;Up &nbsp;
                    </button>
                    <button type="button" class="btn" ng-click="clickDown()">
                        Down
                    </button>
                </div>
                <div ng-if="votedDown == 1">
                    <button type="button" class="btn" ng-click="clickUp()">
                        &nbsp; &nbsp;Up &nbsp;
                    </button>
                    <button type="button" class="btn btn-danger" ng-click="clickDown()">
                        Down
                    </button>
                </div>
                <div ng-if="votedDown == 0 && votedUp == 0">
                    <button type="button" class="btn" ng-click="clickUp()">
                        &nbsp;&nbsp;Up &nbsp;
                    </button>
                    <button type="button" class="btn" ng-click="clickDown()">
                        Down
                    </button>
                </div>
                <br>
                <div class="text"><b><label>{{upQuestion}} upvote</label></b> || <b><label>{{DownQuestion}} downvote</label></b>
                </div>
            </div>

            <div class="col-sm-9 content ">
                <span>${question.content}</span>
            </div>
        </div>
        <div class="hr col-sm-11"></div>
        <div class="col-sm-12 answer"><h2>Answer : </h2></div>
        <div ng-repeat=" answer in answers" class="col-sm-12 answertext">
            <div class="col-sm-2 ">
                <button type="button" class="btn ">
                    <span class="glyphicon glyphicon-thumbs-up" ng-click="clickUpAnswer(answer.id)"></span>
                </button>
                <button type="button" class="btn">
                    <span class="glyphicon glyphicon-thumbs-down" ng-click="clickDownAnswer(answer.id)"></span>
                </button>
                <br>
                <div class="text"><b><label>{{VoteDownAnswer[answer.id]}} unlike</label></b> || <b><label>{{VoteUpAnswer[answer.id]}}
                    like</label></b></div>
            </div>

            <div class="col-sm-10 infor1">
                <div class="col-sm-12 inforanswer">

                    <label><i><a href="/{{answer.user.id}}">{{answer.user.name}}</a></i></label>
                    <label><i>, {{answer.time | date : 'yyyy/MM/dd' }}</i></label></div>

                <div class="col-sm-12">
                <span>{{answer.content}}</span>
            </div>

        </div>
            <div class="hr1 col-sm-11"></div>
        </div>
        <div ng-if="kiemtra == 1" class="col-sm-12">
            <form ng-submit="submitAnswer()">
                <div class="col-sm-12 input">
                    <div class="col-sm-2">&nbsp;</div>
                    <div class="col-sm-8 comment "><textarea type="text" rows="5" class="form-control"
                                                    ng-model="AnswerForm.content" required></textarea></div>
                    <div class="col-sm-2">
                        <input type="submit" class="btn btn-primary" value="Submit"/>
                    </div>
                </div>
            </form>
        </div>
        <div ng-if="kiemtra == 2">
            <div class="col-sm-12 login"><a href="/login">Moi ban dang nhap</a></div>
        </div>

    </div>
</div>
<script type="text/javascript">
    var Askme = angular.module("Askme", []);

    Askme.controller("headerController", function ($scope, $http) {
        $scope.kiemtra = 0;
        $scope.user = "";
        $scope.headerForm = {
            search: ""
        };
        checkdangnhap();
        test();

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
        };
        function test() {
            $http({
                method: 'GET',
                url: 'http://localhost:8080/testabc'
            }).then(function successCallback(response) {
                $scope.user = response.data;
            }), function errorCallback(response) {
                console.log(response.statusText);
            }
        };
        $scope.submitSearch = function () {
            var name = "/search/" + $scope.headerForm.search;
            location.href = name;
        };


    });

    Askme.controller("AnswerController", function ($scope, $http) {
        $scope.kiemtra = 0;
        checkdangnhap();
        $scope.upQuestion =${up_vote_question};
        $scope.DownQuestion =${down_vote_question};
        $scope.votedUp =${voted.upvote};
        $scope.votedDown =${voted.downvote};
        $scope.AnswerForm = {
            content: "",
            image: ""
        };

        $scope.answers = [];
        $scope.VoteUpAnswer = [];
        $scope.VoteDownAnswer = [];

        refreshAnswerData();
        function refreshAnswerData() {
            $http({
                method: 'GET',
                url: 'http://localhost:8080/getAllAnswer/${question.id_question}'
            }).then(function successCallback(response) {
                $scope.answers = response.data;
            }), function errorCallback(response) {
                console.log(response.statusText);
            }

        }

        $scope.refreshVoteUpAnswerData = function () {

            $http({
                method: 'GET',
                url: 'http://localhost:8080/getListCountVoteUpAnswer/${question.id_question}'
            }).then(function successCallback(response) {
                $scope.VoteUpAnswer = response.data;
            }, function errorCallback(response) {
                console.log(response.statusText);
            });

        }
        $scope.refreshVoteDownAnswerData = function () {

            $http({
                method: 'GET',
                url: 'http://localhost:8080/getListCountVoteDownAnswer/${question.id_question}'
            }).then(function successCallback(response) {
                $scope.VoteDownAnswer = response.data;
            }, function errorCallback(response) {
                console.log(response.statusText);
            });

        }
        //17/4
        $scope.clickUp = function () {
            if ($scope.kiemtra == 1) {
                if ($scope.votedUp != 1) {
                    $http({
                        method: 'POST',
                        url: 'http://localhost:8080/voteUpQuestion/${question.id_question}'
                    });

                    if ($scope.votedDown == 1) {
                        $scope.upQuestion++;
                        $scope.DownQuestion--;
                        $scope.votedDown = 0;
                        $scope.votedUp = 1;
                    } else if ($scope.votedDown == 0) {
                        $scope.upQuestion++;
                        $scope.votedDown = 0;
                        $scope.votedUp = 1;
                    }
                }
            }
            else {
                alert("Dang nhap de vote cau hoi va cau tra loi");
            }

        }
        $scope.clickDown = function () {
            if ($scope.kiemtra == 1) {
                if ($scope.votedDown != 1) {
                    $http({
                        method: 'POST',
                        url: 'http://localhost:8080/voteDownQuestion/${question.id_question}'
                    });
                    if ($scope.votedUp == 1) {
                        $scope.DownQuestion++;
                        $scope.upQuestion--;
                        $scope.votedDown = 1;
                        $scope.votedUp = 0;
                    }
                    else if ($scope.votedUp == 0) {
                        $scope.DownQuestion++;
                        $scope.votedDown = 1;
                        $scope.votedUp = 0;
                    }
                }
            }
            else {
                alert("Dang nhap de vote cau hoi va cau tra loi");
            }
        }


        $scope.clickUpAnswer = function (id) {
            urlstr = 'http://localhost:8080/voteUpAnswer/' + id;
            $http({
                method: 'POST',
                url: urlstr
            })

            $scope.VoteUpAnswer[id]++;
            $scope.VoteDownAnswer[id]--;

        }
        $scope.clickDownAnswer = function (id) {
            urlstr = 'http://localhost:8080/voteDownAnswer/' + id;
            $http({
                method: 'POST',
                url: urlstr
            })
            $scope.VoteUpAnswer[id]--;
            $scope.VoteDownAnswer[id]++;

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
            console.log($scope.kiemtra);
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
            $scope.answers.push({
                content : $scope.AnswerForm.content,
                user :  {name : '${userquestion.name}'},
                time : (new Date()).getTime()
            });
            $scope.AnswerForm.content="";
            $scope.AnswerForm.image="";
        };
        $scope.refreshVoteUpAnswerData();
        $scope.refreshVoteDownAnswerData();
    });

</script>

</body>
</html>
