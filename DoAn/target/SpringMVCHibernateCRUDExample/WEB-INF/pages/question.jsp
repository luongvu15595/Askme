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
        }

        .content {
            margin-top: 5px;
            font-size: 20px;
            border-style: outset;
        }

        .content1 {
            margin-top: 20px;

        }

        .createby {
            float: right;
            margin-right: 130px;
        }

        .infor {
            font-size: 12px;
            margin-top: 5px;
        }

        .input {
            margin-top: 30px;
        }

        .text {
            font-size: 15px;
        }

        .contentanswer {
            font-size: 15px;
        }

        .answer {
            margin-top: 15px;
        }
        .height{
            height : 50%;
        }
    </style>

</head>
<body ng-app="Askme" ng-controller="AnswerController">

<div class="container title">
    <div class="row">

        <div    class="col-sm-12">
            <label><b>{{question.title}}</b></label>
            <img src="/image/${question.id_question}" width="600px" height="400px"/>
            <label class="createby" ng-if="kiemtra == 1">
                <a href="/report/{{question.id_question}}">
                    <button type="button" class="btn">
                        report
                    </button>
                </a>
                <!-- Modal 28-4-->
                <label ng-if="question.user.id == ${userlogin.id} || ${isAdmin} == 1">
                    <button type="button" class="btn" data-toggle="modal" data-target="#delModalQuestion">
                        Xoa
                    </button>


                    <div class="modal fade" id="delModalQuestion" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3 class="modal-title"> {{question.title}}</h3>
                                </div>
                                <div class="modal-body">
                                    <h4>Xoa bo bai dang ??</h4>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">&nbsp;Giu
                                    </button>
                                    <a href="/">
                                        <button type="button" class="btn btn-default"
                                                ng-click="delQuestion()">Xoa
                                        </button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </label>
                <!-- Modal 28-4-->
                <label ng-if="question.user.id == ${userlogin.id} ">
                    <button type="button" class="btn" data-toggle="modal" data-target="#editModalQuestion"
                            ng-click="questionmodal()">Sua
                    </button>

                    <div class="modal fade" id="editModalQuestion" role="dialog">
                        <div class="modal-dialog ">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-body height">
                                    <div class="input col-sm-12">
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-10"><input type="text"  class="form-control"
                                                                      ng-model="questionx.title"
                                                                      required/></div>
                                        <div class="col-sm-1"></div>
                                    </div>
                                    <div class="input col-sm-12">
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-10"><textarea type="text" rows="5" class="form-control"
                                                                         ng-model="questionx.content"
                                                                         required></textarea></div>
                                        <div class="col-sm-1"></div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">&nbsp;Giu
                                    </button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal"
                                            ng-click="editQuestion()">Sua
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </label>
            </label>
        </div>
        <div class="col-sm-2 content1">
            <div ng-if="voted == 1">

                <button type="button" class="btn btn-success" ng-click="clickUp()">
                    &nbsp; &nbsp;Up &nbsp;
                </button>
                <button type="button" class="btn" ng-click="clickDown()">
                    Down
                </button>
            </div>
            <div ng-if="voted == 2">
                <button type="button" class="btn" ng-click="clickUp()">
                    &nbsp; &nbsp;Up &nbsp;
                </button>
                <button type="button" class="btn btn-danger" ng-click="clickDown()">
                    Down
                </button>
            </div>
            <div ng-if="voted ==0">
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

        <div class="col-sm-10 content contentanswer ">
            <label>{{question.content}}</label>
        </div>
        <div class="col-sm-12 infor">
            <div class="col-sm-2">&nbsp;</div>
            <label>create By</label>
            <div class="createby"><label>Time</label></div>
            <br>
            <div class="col-sm-2">&nbsp;</div>
            <label>{{question.user.name}}</label>
            <div class="createby"><label>{{question.time | date : 'yyyy/MM/dd'}}</label></div>
        </div>

        <div class="col-sm-12 answer"><h2>Answer : </h2></div>
        <div ng-repeat=" answer in answers">
            <div class="col-sm-2 content1">
                <div ng-if="VoteAnswer[answer.id]['voted'] == 0">
                    <button type="button" class="btn" ng-click="clickUpAnswer(answer.id)">
                        &nbsp; &nbsp;Up &nbsp;
                    </button>
                    <button type="button" class="btn" ng-click="clickDownAnswer(answer.id)">
                        Down
                    </button>
                </div>
                <div ng-if="VoteAnswer[answer.id]['voted'] == 1">
                    <button type="button" class="btn btn-success" ng-click="clickUpAnswer(answer.id)">
                        &nbsp; &nbsp;Up &nbsp;
                    </button>
                    <button type="button" class="btn" ng-click="clickDownAnswer(answer.id)">
                        Down
                    </button>
                </div>
                <div ng-if="VoteAnswer[answer.id]['voted'] == 2">
                    <button type="button" class="btn" ng-click="clickUpAnswer(answer.id)">
                        &nbsp; &nbsp;Up &nbsp;
                    </button>
                    <button type="button" class="btn btn-danger" ng-click="clickDownAnswer(answer.id)">
                        Down
                    </button>
                </div>
                <br>

                <div class="text">
                    <b>
                        <label>{{VoteAnswer[answer.id]["countup"]}} upvote</label>
                    </b> ||
                    <b><label>{{VoteAnswer[answer.id]["countdown"]}}downvote</label>
                    </b>
                </div>
            </div>

            <div class="col-sm-10 content contentanswer ">
                <label>{{answer.content}}</label>
            </div>
            <div class="col-sm-12 infor">
                <div class="col-sm-2">&nbsp;</div>
                <label>Create by</label>
                <div class="createby"><label>Time</label></div>
                <br>
                <div class="col-sm-2">&nbsp;</div>
                <label>{{answer.user.name}}</label>
                <div class="createby"><label>{{answer.time | date : 'yyyy/MM/dd' }}</label></div>
                <br>
                <div class="col-sm-2">&nbsp;</div>

                <!--25/4 user co the ua va xoa cau tra loi cua minh-->
                <div ng-if="answer.user.email == '${userlogin.email}' || ${isAdmin} == 1">

                    <button type="button" class="btn" data-toggle="modal" data-target="#delModalAnswer"
                            ng-click="answermodal(answer)">Xoa
                    </button>
                    <!-- Modal -->

                    <div class="modal fade" id="delModalAnswer" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3 class="modal-title"> {{answerx.content}}</h3>
                                </div>
                                <div class="modal-body">
                                    <h4>Xoa bo cau tra loi ??</h4>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">&nbsp;Giu
                                    </button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal"
                                            ng-click="delAnswer()">Xoa
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--25/4 user co the ua va xoa cau tra loi cua minh-->
                    <button type="button" class="btn" data-toggle="modal" data-target="#editModalAnswer"
                            ng-click="answermodal(answer)">Sua
                    </button>

                    <div class="modal fade" id="editModalAnswer" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-body">
                                    <div class="input">
                                        <div class="col-sm-2">&nbsp;</div>
                                        <div class="col-sm-8"><textarea type="text" rows="4" class="form-control"
                                                                        ng-model="AnswereditForm.content"
                                                                        required></textarea></div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">&nbsp;Giu
                                    </button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal"
                                            ng-click="editAnswer(answer)">Sua
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div ng-if="kiemtra == 1">
            <form ng-submit="submitAnswer('${userlogin.name}','${userlogin.email}')">
                <div class="col-sm-12 input">
                    <div class="col-sm-2">&nbsp;</div>
                    <div class="col-sm-8"><textarea type="text" rows="10" class="form-control"
                                                    ng-model="AnswerForm.content" required></textarea></div>
                    <div class="col-sm-2">
                        <input type="submit" class="btn btn-primary" value="Submit"/>
                    </div>
                </div>
            </form>
        </div>
        <div ng-if="kiemtra == 2">
            <div class="col-sm-12 input"><a href="/login">Moi ban dang nhap</a></div>
        </div>

    </div>
</div>
<script type="text/javascript">
    var Askme = angular.module("Askme", []);
    Askme.controller("AnswerController", function ($scope, $http) {
        $scope.kiemtra = 0;
        checkdangnhap();
        $scope.question = {
            id_question: "${question.id_question}",
            title: "${question.title}",
            content: "${question.content}",
            user: {
                id: "${question.user.id}",
                name: "${question.user.name}",
                email: "${question.user.email}"
            }

        }

        $scope.upQuestion =${up_vote_question};
        $scope.DownQuestion =${down_vote_question};
        $scope.voted =${voted};
        $scope.isAdmin =${isAdmin};

        $scope.AnswerForm = {
            content: "",
            image: ""
        };
        $scope.AnswereditForm = {
            content: "",
            image: ""
        };

        $scope.answers = [];
        $scope.answer = {
            id: "",
            content: "",
            image: ""
        };
        $scope.VoteAnswer = ["", []];

        refreshAnswerData();
        function refreshAnswerData() {
            $http({
                method: 'GET',
                url: 'http://localhost:8080/getallanswer/${question.id_question}'
            }).then(function successCallback(response) {
                $scope.answers = response.data;
            }), function errorCallback(response) {
                console.log(response.statusText);
            }

        }

        refreshVoteAnswerData();
        function refreshVoteAnswerData() {
            $http({
                method: 'GET',
                url: 'http://localhost:8080/getmapvoteanswers/${question.id_question}'
            }).then(function successCallback(response) {
                $scope.VoteAnswer = response.data;
            }), function errorCallback(response) {
                console.log(response.statusText);
            }

        }


        //17/4
        $scope.clickUp = function () {
            if ($scope.kiemtra == 1) {
                if ($scope.voted != 1) {
                    $http({
                        method: 'POST',
                        url: 'http://localhost:8080/voteupquestion/${question.id_question}'
                    });

                    if ($scope.voted == 2) {
                        $scope.upQuestion++;
                        $scope.DownQuestion--;

                    } else if ($scope.voted == 0) {
                        $scope.upQuestion++;

                    }
                    $scope.voted = 1;
                }
            }
            else {
                alert("Dang nhap de vote cau hoi va cau tra loi");
            }

        }
        $scope.clickDown = function () {
            if ($scope.kiemtra == 1) {
                if ($scope.voted != 2) {
                    $http({
                        method: 'POST',
                        url: 'http://localhost:8080/votedownquestion/${question.id_question}'
                    });
                    if ($scope.voted == 1) {
                        $scope.DownQuestion++;
                        $scope.upQuestion--;

                    }
                    else if ($scope.voted == 0) {
                        $scope.DownQuestion++;

                    }
                    $scope.voted = 2;
                }
            }
            else {
                alert("Dang nhap de vote cau hoi va cau tra loi");
            }
        }


        $scope.clickUpAnswer = function (id) {
            if ($scope.kiemtra == 1) {
                urlstr = 'http://localhost:8080/voteupanswer/' + id;
                $http({
                    method: 'POST',
                    url: urlstr
                })
                if ($scope.VoteAnswer[id]["voted"] != 1) {
                    if ($scope.VoteAnswer[id]["voted"] == 0) {
                        $scope.VoteAnswer[id]["countup"]++;
                        $scope.VoteAnswer[id]["voted"] = 1;

                        // $scope.VoteAnswer[id] = {"countup" :1,"countdown" :0,"voted" :1 };
                    }
                    else if ($scope.VoteAnswer[id]["voted"] == 2) {
                        $scope.VoteAnswer[id]["countup"]++;
                        $scope.VoteAnswer[id]["countdown"]--;
                        $scope.VoteAnswer[id]["voted"] = 1;
                    }
                }
            }
            else {
                alert("Dang nhap de vote cau hoi va cau tra loi");
            }

        }
        $scope.clickDownAnswer = function (id) {
            if ($scope.kiemtra == 1) {
                urlstr = 'http://localhost:8080/votedownanswer/' + id;
                $http({
                    method: 'POST',
                    url: urlstr
                })
                if ($scope.VoteAnswer[id]["voted"] != 2) {
                    if ($scope.VoteAnswer[id]["voted"] == 0) {
                        $scope.VoteAnswer[id]["countdown"]++;
                        $scope.VoteAnswer[id]["voted"] = 2;

                        // $scope.VoteAnswer[id] = {"countup" :1,"countdown" :0,"voted" :1 };
                    }
                    else if ($scope.VoteAnswer[id]["voted"] == 1) {
                        $scope.VoteAnswer[id]["countup"]--;
                        $scope.VoteAnswer[id]["countdown"]++;
                        $scope.VoteAnswer[id]["voted"] = 2;
                    }
                }

            }
            else {
                alert("Dang nhap de vote cau hoi va cau tra loi");
            }

        }

        //kiem tra dang nhap
        function checkdangnhap() {
            $http({
                method: 'GET',
                url: 'http://localhost:8080/testthu'
            }).then(function successCallback(response) {
                $scope.kiemtra = response.data;
            }, function errorCallback(response) {
                console.log(response.statusText);
            })

        }

        //25-4 : ham delAnswer() gui yeu cau xoa cau tra loi
        $scope.delAnswer = function () {
            urlstr = 'http://localhost:8080/delanswer/' + $scope.answerx.id;
            $http({
                method: 'DELETE',
                url: urlstr
            })
            $scope.answers.splice($scope.answers.indexOf($scope.answerx), 1);
        }

        //26-4 sua noi dung cau tra loi
        $scope.editAnswer = function () {
            console.log($scope.answerx.id);
            $scope.answerx.content = $scope.AnswereditForm.content;
            $http({
                method: "PUT",
                url: 'http://localhost:8080/editanswer',
                data: angular.toJson($scope.answerx),
                headers: {
                    'Content-Type': 'application/json'
                }
            })
        }
        //26-4 load data answer to modal
        $scope.answermodal = function (answer) {
            console.log(answer.id);
            $scope.answerx = answer;
            $scope.AnswereditForm.content = answer.content;
            $scope.AnswereditForm.image = answer.image;
        }

        //28-4 load data question to modal
        $scope.questionmodal = function () {
            $scope.questionx = {
                title : $scope.question.title,
                content: $scope.question.content
            }
        }
        //28-4 sua noi dung cau hoi
        $scope.editQuestion = function () {
            $scope.question.title =$scope.questionx.title;
            $scope.question.content=$scope.questionx.content;
            $http({
                method: "PUT",
                url: 'http://localhost:8080/updatequestion',
                data: angular.toJson($scope.question),
                headers: {
                    'Content-Type': 'application/json'
                }
            })
        }

        //28-4 delQuestion
        $scope.delQuestion = function () {
            urlstr = 'http://localhost:8080/delquestion/' + $scope.question.id_question;
            $http({
                method: 'DELETE',
                url: urlstr
            })
        }

        $scope.submitAnswer = function (name, email) {

            $http({
                method: "POST",
                url: "/createAnswer/${question.id_question}",
                data: angular.toJson($scope.AnswerForm),
                headers: {
                    'Content-Type': 'application/json'
                }
            })
                .then(function success(response) {
                    $scope.res = response.data;
                    console.log($scope.res.id);
                    $scope.answers.push({
                        id: $scope.res.id,
                        content: $scope.res.content,
                        user: {name: name, email: email},
                        time: $scope.res.time
                    });

                    $scope.VoteAnswer[$scope.res.id] = {"countup": 0, "countdown": 0, "voted": 0};
                    $scope.AnswerForm.content = "";
                    $scope.AnswerForm.image = "";
                })

        };


    })

</script>

</body>
</html>
