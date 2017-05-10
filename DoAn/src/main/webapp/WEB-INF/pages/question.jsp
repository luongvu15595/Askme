<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AnswerForQuestion</title>

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://mbenford.github.io/ngTagsInput/css/ng-tags-input.min.css" />
    <script src="http://mbenford.github.io/ngTagsInput/js/ng-tags-input.min.js"></script>
    <script src="/js/app.js"></script>
    <%--//9/5--%>

    <%--//9/5--%>
    <style type="text/css">
        .title {
            font-size: 30px;
            margin-top: 1em;
            text-align: justify;
        }

        .content {
            margin-top: 15px;
            font-size: 15px;
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
        .image{
            margin-top: 15px;
        }
        .link{
            margin-top: 15px;
            float: left;
        }
        .createby{
            margin-left: 0px;
        }
    </style>

</head>
<body ng-app="Askme">
<div id="fb-root"></div>
<script>
    window.fbAsyncInit = function() {
        FB.init({appId: '1028308307300721', status: true, cookie: true,
            xfbml: true});
    };
    (function() {
        var e = document.createElement('script'); e.async = true;
        e.src = document.location.protocol +
            '//connect.facebook.net/en_US/all.js';
        document.getElementById('fb-root').appendChild(e);
    }());
</script>
<jsp:include page="header.jsp"/>

<div class="container title"  ng-controller="AnswerController" ng-init="
                                                               question = {
                                                                                id_question: '${question.id_question}',
                                                                                title: '${question.title}',
                                                                                time: '${question.time}',
                                                                                content: '${question.content}',
                                                                                image: '${question.image}',
                                                                                user: {
                                                                                id: '${question.user.id}',
                                                                                name: '${question.user.name}',
                                                                                email: '${question.user.email}'
                                                                                }

                                                                           };
                                                                upQuestion =${up_vote_question};
                                                                DownQuestion =${down_vote_question};
                                                                voted =${voted};
                                                                isAdmin =${isAdmin};
                                                                nginit('${question.id_question}');
                                                                                   ">
    <div class="row">

        <div class="col-sm-12">
            <div class="col-sm-2"></div>
            <div class="col-sm-9"><label class="title1"><b>{{question.title}}</b></label></div>
        </div>

        <div class="col-sm-12 infor">
            <div class="col-sm-2"></div>
            <div class="col-sm-10">
                <span><a href="/{{question.user.id}}">{{question.user.name}}</a></span>
                <span>,{{question.time | date : 'hh:mm dd/MM/yyyy'}}</span>
            </div>

        </div>
        <div class="col-sm-12">
            <div class="col-sm-2 updown">
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

            <div class="col-sm-9 content">
	            <div>{{question.content}}</div>
                <div class="image"><img src="/image/${question.id_question}" width="700px" height="400px"/></div>

                <div class="link" ng-if="kiemtra == 1 || kiemtra == 3">
                    <button ng-click="share()">SHARE</button>
                    <span ng-if="question.user.id != ${userlogin.id} && ${isAdmin} != 1">
                        <a href="/report/{{question.id_question}}">
                            report
                        </a>
                    </span>
                    <!-- Modal 28-4-->
                    <span ng-if="question.user.id == ${userlogin.id} || ${isAdmin} == 1">
                        <a type="button" class="btn" data-toggle="modal" data-target="#delModalQuestion">
                            Xoa
                        </a>
                    </span>

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

                    <!-- Modal 28-4-->
                    <span ng-if="question.user.id == ${userlogin.id} ">
                        <a type="button" class="btn" data-toggle="modal" data-target="#editModalQuestion"
                                ng-click="questionmodal()">Sua
                        </a>
                    </span>
                    <div class="modal fade" id="editModalQuestion" role="dialog">
                        <div class="modal-dialog ">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-body heightq">
                                    <form name="myForm">
                                        <div class="input col-sm-12">
                                            <div class="col-sm-1"></div>
                                            <div class="col-sm-10"><input type="text"  class="form-control" name="xtitle"
                                                                          ng-model="questionx.title"
                                                                          ng-minlength="10" ng-maxlength="100"
                                                                          required/></div>
                                            <div class="col-sm-1"></div>
                                        </div>
                                        <div class="input col-sm-12">
                                            <div class="col-sm-1"></div>
                                            <div class="col-sm-10"><textarea type="text" rows="5" class="form-control" name="xcontent"
                                                                             ng-model="questionx.content"
                                                                             ng-minlength="10" ng-maxlength="500"
                                                                             required></textarea></div>
                                            <div class="col-sm-1"></div>
                                        </div>
                                        <div class=" col-sm-12">
                                            <div class="col-sm-1"></div>
                                            <div class="col-sm-10" style="color:red">
                                              <span class="error" ng-show="myForm.xtitle.$error.minlength">
                                                <h4>Tiêu đề quá ngắn !! </h4>
                                              </span>
                                                <span class="error" ng-show="myForm.xtitle.$error.maxlength">
                                                  <h4>Tiêu đề quá dài !! </h4>
                                              </span>
                                            </div>
                                        </div>
                                        <div class="col-sm-12" style="color:red">
                                            <div class="col-sm-1"></div>
                                            <div class="col-sm-10">
                                                <div class="error" ng-show="myForm.xcontent.$error.minlength">
                                                    <h4>Nội dung quá ngắn !! </h4>
                                                </div>
                                                <div class="error" ng-show="myForm.xcontent.$error.maxlength">
                                                    <h4>Nội dung quá dài !! </h4>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">&nbsp;Giu
                                    </button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal" ng-click="editQuestion()"
                                            ng-disabled="myForm.xtitle.$error.minlength || myForm.xtitle.$error.maxlength
                                            || myForm.xcontent.$error.minlength || myForm.xcontent.$error.maxlength" >Sua
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>

        <div class="hr col-sm-11"></div>

        <div class="col-sm-12 answer"><h2>Answer : </h2></div>
        <div ng-repeat=" answer in answers" class="col-sm-12 answertext">
            <div class="col-sm-2 ">
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

            <div class="col-sm-10 infor1">
                <div class="col-sm-12">
                    <span><i><a href="/{{answer.user.id}}">{{answer.user.name}}</a></i></span>
                    <span><i>{{answer.time | date : 'hh:mm dd/MM/yyyy' }}</i></span>
                </div>
                <div class="col-sm-12">
                    <div>{{answer.content}}</div>
                    <div class="link">


                        <!--25/4 user co the ua va xoa cau tra loi cua minh-->
                        <div class="createby" ng-if="answer.user.email == '${userlogin.email}' || ${isAdmin} == 1">

                            <a type="button" class="btn" data-toggle="modal" data-target="#delModalAnswer"
                                    ng-click="answermodal(answer)">Xoa
                            </a>
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
                            <a type="button" class="btn" data-toggle="modal" data-target="#editModalAnswer"
                                    ng-click="answermodal(answer)">Sua
                            </a>

                            <div class="modal fade" id="editModalAnswer" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-body heighta">
                                            <form name="myForm">
                                                <div class="input col-sm-12">
                                                    <div class="col-sm-1"></div>
                                                    <div class="col-sm-10"><textarea type="text" rows="5" class="form-control" name="aswcontentedit"
                                                                                     ng-model="AnswereditForm.content"
                                                                                     ng-minlength="10" ng-maxlength="500"
                                                                                     required></textarea></div>
                                                    <div class="col-sm-1"></div>
                                                </div>
                                                <div class=" col-sm-12">
                                                    <div class="col-sm-1"></div>
                                                    <div class="col-sm-10">
                                              <span class="error" ng-show="myForm.aswcontentedit.$error.minlength">
                                                <h4>Tiêu đề quá ngắn !! </h4>
                                              </span>
                                                        <span class="error" ng-show="myForm.aswcontentedit.$error.maxlength">
                                                  <h4>Tiêu đề quá dài !! </h4>
                                              </span>
                                                    </div>
                                                </div>

                                            </form>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">&nbsp;Giu
                                            </button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal"
                                                    ng-click="editAnswer(answer)"
                                                    ng-disabled="myForm.aswcontentedit.$error.minlength || myForm.aswcontentedit.$error.maxlength">
                                                Sua
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>




            </div>
            <div class="hr1 col-sm-11"></div>
        </div>
        <div ng-if="kiemtra == 1 || kiemtra == 3">
            <form ng-submit="submitAnswer('${userlogin.name}','${userlogin.email}')">
                <div class="col-sm-12 input">
                    <div class="col-sm-2">&nbsp;</div>
                    <div class="col-sm-8 comment"><textarea minlength="10" maxlength="200" type="text" rows="5" class="form-control"
                                                    ng-model="AnswerForm.content" required></textarea></div>
                    <div class="col-sm-2">
                        <input type="submit" class="btn btn-primary" value="Comment"/>
                    </div>
                </div>
            </form>
        </div>
        <div ng-if="kiemtra == 2">
            <div class="col-sm-12 input"><a href="/login">Moi ban dang nhap</a></div>
        </div>

    </div>
</div>


</body>
</html>
