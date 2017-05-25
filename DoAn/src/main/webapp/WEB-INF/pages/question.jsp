<!DOCTYPE html>
<html>
<title>Chi tiết câu hỏi</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<link rel="stylesheet" href="http://mbenford.github.io/ngTagsInput/css/ng-tags-input.min.css" />
<script src="http://mbenford.github.io/ngTagsInput/js/ng-tags-input.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/angular-ui-bootstrap/0.11.0/ui-bootstrap-tpls.js"></script>
<script src="/js/dirPagination.js"></script>
<script src="/js/ng-infinite-scroll.js"></script>
<script src="/js/app.js"></script>
<style>

    .input {
        margin-top: 30px;
    }

    .answer {
        margin-top: 15px;
    }

    .comment{
        margin-bottom: 1em;
    }
    html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
    span{
        width: 46px;
        height: 46px;
        display: block;
        text-align: center;
        line-height: 3.3;
        margin-bottom: 15px;
        border: 1px solid #d9dfe9;
        -moz-border-radius: 50%;
        -webkit-border-radius: 50%;
        border-radius: 50%;
    }
    .li{
        display: inline-block;
        margin-left: 40px;
        width: 46px;
        height: 46px;
        text-align: center;
        text-align: center;
        line-height: 0.3;
        margin-bottom: 10px;
        border: 1px solid #d9dfe9;
        -moz-border-radius: 50%;
        -webkit-border-radius: 50%;
        border-radius: 50%;
    }
    .left{
        margin-left: 20px;
    }
    .answer{
        margin-left: 40px;
        width: 46px;
        height: 46px;
        text-align: center;
        text-align: center;
        line-height: 3.3;
        margin-bottom: 15px;
    }
    .question-title{
        color: #444c63;
        font-size: 20px;
        font-weight: 700;
        word-break: break-word;

    }
    h2{
        font-weight: 500;
        line-height: 1.1;
        color: inherit;
        display: block;
        font-size: 0.5em;
        -webkit-margin-before: 0.83em;
        -webkit-margin-after: 0.83em;
        -webkit-margin-start: 0px;
        -webkit-margin-end: 0px;
        font-weight: bold;
    }
    a{
        text-decoration: none;
        background-color: transparent;
    }
    .question-tags{
        display: inline-block;
        margin-bottom: 10px;
        -webkit-padding-start: 40px;
    }
    li{
        margin-top: 10px;
        margin-right: 5px;
        margin-bottom: 10px;
        margin-left: 0px;
        display: inline-block;
        text-align: -webkit-match-parent;
    }

    .heighta{
        margin-top: 30px;
        height: 200px;
    }
    .heightq1{
        margin-top: 30px;
        height: 300px;
    }
    .q-tag{
        margin-top: 10px;
        color: #6f7d95;
        border: 1px solid #d9dfe9;
        border-top-color: rgb(217, 223, 233);
        border-top-style: solid;
        border-top-width: 1px;
        border-right-color: rgb(217, 223, 233);
        border-right-style: solid;
        border-right-width: 1px;
        border-bottom-color: rgb(217, 223, 233);
        border-bottom-style: solid;
        border-bottom-width: 1px;
        border-left-color: rgb(217, 223, 233);
        border-left-style: solid;
        border-left-width: 1px;
        border-image-source: initial;
        border-image-slice: initial;
        border-image-width: initial;
        border-image-outset: initial;
        border-image-repeat: initial;
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        border-radius: 10px;
        background-color: #f3f5f9;
        text-decoration: none;
        color: #6f7d95;
        line-height: 20px;
        display: inline-block;
        padding: 0 10px;
        margin-right: 5px;
        outline: none;
        text-decoration: none;
    }
    .info{
        margin-top: 20px;
        margin-bottom: 30px;
    }
    .questions-count {
        border-left: 4px solid #3498db;
        margin-top: 30px;
        line-height: .6;

    }
    .members-count {
        border-left: 4px solid #f39c12;
        line-height: .6;
    }
    .number{
        font-weight: 700;
        font-size: 36px;
        line-height: 2px;
        display: block;
        color: #2c3e50;
        height: 30px;
        width: 70px;
        margin-top: 24px;
    }

    .p {
        width: 116px;
        font-size: 16px;
        color: #7a838e;
        padding-left: 7px;
        margin: 0;
    }
    .hotquestions {
        margin-left: 10px;
        margin-bottom: 10px;
        min-height: 35px;
        word-wrap: break-word;
        overflow: hidden;
        display: block;
        line-height: 1.3;
    }
    .number1 {
        background: #3498db;
        color: #fff;
        border-radius: 50%;
        -moz-border-radius: 50%;
        -webkit-border-radius: 50%;
        -ms-border-radius: 50%;
        width: 15px;
        height: 15px;
        display: inline-block;
        text-align: center;
        line-height: 15px;
        font-size: 10px;
    }
    .name{
        display: inline-block;
        width: 65%;
        vertical-align: middle;}
    .questions-count-hotuser {
        display: inline-block;
        margin-right: 4px;
        /* font-size: 12px; */
    }
    .question-content {
        color: #5f6f81;
        word-wrap: break-word;
        margin-bottom: 20px;
    }
    .answers-count {
        color: #444c63;
        font-size: 14px;
        font-weight: 700;
        display: block;
        margin-top: 12px;
    }
    .title{
        margin-left: 229px;
    }
    .home{
        text-align: center;
        font-size: 14px;
        margin-top: 6px;
    }
    a.home{
        color: #337ab7;
    }
</style>
<body class="w3-theme-l5" ng-app="Askme" ng-controller="AnswerController" ng-init="
                                                               question = {
                                                                                id_question: '${question.id_question}',
                                                                                title: '${question.title}',
                                                                                time: '${question.time}',
                                                                                content: '${question.content}',

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
                                                                nginit('${question.id_question}','${question.image}');
                                                                                   ">

<!-- Navbar -->
<jsp:include page="header.jsp"/>

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:2000px;margin-top:80px">
    <!-- The Grid -->
    <div class="w3-row">
        <!-- Left Column -->
        <div class="w3-col m2">
            <!-- Profile -->
            <div class="w3-card-2 w3-round w3-white " style="height: 110px">
                <div class="w3-container" >
                    <label style="width: 100%;
            height: 20px;
            border: none;
            margin-top: 30px;
            margin: 0 auto;
            display: block;
            font-weight: 700;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            border-radius: 3px;"></label>

                    <div ng-if="kiemtra == 2"><a href="/login"><button style="background: #3498db;color: #fff;width: 100%;
            height: 45px;
            border: none;
            color: #fff;
            margin-top: 30px;
            margin: 0 auto;
            display: block;
            font-weight: 700;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            border-radius: 3px;
            background-color: #3397db;"><i class="fa fa-plus"></i>  ĐẶT CÂU HỎI
                    </button></a></div>
                    <div ng-if="kiemtra == 1||kiemtra == 3"><a href="/createQuestion"><button style="background: #3498db;color: #fff;width: 100%;
            height: 45px;
            border: none;
            color: #fff;
            margin-top: 30px;
            margin: 0 auto;
            display: block;
            font-weight: 700;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            border-radius: 3px;
            background-color: #3397db;"><i class="fa fa-plus"></i>  ĐẶT CÂU HỎI
                    </button></a></div>
                </div>
            </div>
            <br>

            <!-- Accordion -->
            <div class="w3-card-2 w3-round">
                <div class="w3-white">
                    <a href="/"><button type="button" class="w3-button w3-block w3-left-align"><i class="fa fa-question-circle fa-fw w3-margin-right"></i> Tất cả câu hỏi</button></a>
                    <a href="/listoftag"><button type="button" class="w3-button w3-block w3-left-align"><i class="fa fa-tags  fa-fw w3-margin-right"></i> Tags</button></a>
                    <a href="/listofuser"><button  type="button" class="w3-button w3-block w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> User</button></a>
                </div>
            </div>

            <br>
            <div class="w3-card-2 w3-round w3-white w3-hide-small">
                <div class="w3-container">
                    <div style="text-align: center; margin-top: 20px"><H4>TOP TAGS</H4></div>
                    <hr class="w3-clear">
                    <div style="margin-bottom: 20px;"ng-repeat="tag in taghots" ><label class="q-tag"><a href="/tag/{{tag.id}}">{{tag.name}}</a></label> x {{countquestionbytags[topic.id]}}</div>
                </div>
            </div>
            <!-- End Left Column -->
        </div>

        <!-- Middle Column -->
        <div class="w3-col m8">

            <div class="w3-row-padding">
                <div class="w3-col m12">
                    <div class="w3-card-2 w3-round w3-white ">
                        <div class="w3-container w3-padding">
                            <div>
                                <label class="w3-col m3 home ">
                                    <label><i class="fa fa-angle-double-left"></i>
                                    </label>
                                    <a href="/" class="home">Trang chủ</a>
                                </label>
                                <label class="w3-col m9 ">
                                    <h2 itemprop="name"><a itemprop="url" style="word-wrap: break-word" href="/question/{{question.id_question}}" class="question-title">{{question.title}}</a>
                                    </h2>
                                </label>
                            </div>
                            <hr class="w3-clear w3-col m12">
                            <div class="w3-col m12">
                                <div class="w3-col m3 ">

                                    <div ng-if="voted == 1">

                                        <button type="button" class="btn btn-success li " ng-click="clickUp()">
                                            {{upQuestion}}
                                        </button>
                                        <button type="button" class="btn li" ng-click="clickDown()">
                                            {{DownQuestion}}
                                        </button>
                                    </div>
                                    <div ng-if="voted == 2">
                                        <button type="button" class="btn li" ng-click="clickUp()">
                                            {{upQuestion}}
                                        </button>
                                        <button type="button" class="btn btn-danger li" ng-click="clickDown()">
                                            {{DownQuestion}}
                                        </button>
                                    </div>
                                    <div ng-if="voted ==0">
                                        <button type="button" class="btn li" ng-click="clickUp()">
                                            {{upQuestion}}
                                        </button>
                                        <button type="button" class="btn li" ng-click="clickDown()">
                                            {{DownQuestion}}
                                        </button>
                                    </div>
                                    <div >
                                        <label class="answer">upvote</label>
                                        <label class="answer">downvote</label>
                                    </div>
                                </div>
                                <div class="w3-col m9">

                                    <div class="question-content">{{question.content}}</div>
                                    <div class="image" ng-if="isImage == 1"><img src="/image/${question.id_question}" width="690px" height="400px"/></div>
                                    <div>
                                        <label class="q-tag" ng-repeat=" tag in tags"><a href="/tag/{{tag.id}}">{{tag.name}}</a></label>
                                    </div>
                                    <hr class="w3-clear w3-col m12">
                                    <div class="info">
                                        <img src="/imageuser/{{question.user.id}}" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:30px; margin-right:20px;">
                                        <label><a href="/{{question.user.id}}">{{question.user.name}}</a></label>
                                        <label>, {{question.time | date : 'hh:mm dd/MM/yyyy'}}</label>
                                        <label style="margin-left: 15px" class="link" ng-if="kiemtra == 1 || kiemtra == 3">

                                            <label ng-if="question.user.id != ${userlogin.id} && ${isAdmin} != 1">
                                                <a href="/report/{{question.id_question}}">
                                                    Báo cáo
                                                </a>
                                            </label>
                                            <!-- Modal 28-4-->
                                            <lable ng-if="question.user.id == ${userlogin.id} || ${isAdmin} == 1">
                        <a  class="btn" data-toggle="modal" data-target="#delModalQuestion">
                            Xóa
                        </a>
                    </lable>

                                            <div class="modal fade" id="delModalQuestion" role="dialog">
                                                <div class="modal-dialog">
                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h3 class="modal-title"> {{question.title}}</h3>
                                                        </div>
                                                        <div class="modal-body">
                                                            <h4>Bạn có muốn xóa bài đăng này không?</h4>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">&nbsp;Giữ
                                                            </button>
                                                            <a href="/">
                                                                <button type="button" class="btn btn-default"
                                                                        ng-click="delQuestion()">Xóa
                                                                </button>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Modal 28-4-->
                                            <label ng-if="question.user.id == ${userlogin.id} ">
                        <a  class="btn" data-toggle="modal" data-target="#editModalQuestion"
                           ng-click="questionmodal()">Sửa
                        </a>
                    </label>
                                            <div class="modal fade" id="editModalQuestion" role="dialog">
                                                <div class="modal-dialog ">
                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-body heightq1">
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
                                              <label class="error" ng-show="myForm.xtitle.$error.minlength">
                                                <h4>Tiêu đề quá ngắn !! </h4>
                                              </label>
                                                                        <lable class="error" ng-show="myForm.xtitle.$error.maxlength">
                                                  <h4>Tiêu đề quá dài !! </h4>
                                              </lable>
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
                                                        <div class="modal-footer" style="margin-top: 20px">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">&nbsp;Giữ
                                                            </button>
                                                            <button type="button" class="btn btn-default" data-dismiss="modal" ng-click="editQuestion()"
                                                                    ng-disabled="myForm.xtitle.$error.minlength || myForm.xtitle.$error.maxlength
                                            || myForm.xcontent.$error.minlength || myForm.xcontent.$error.maxlength" >Sửa
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </label>

                                    </div>
                                </div>
                            </div>
                            <hr class="w3-clear w3-col m12">
                            <label class="answers-count">Trả lời:</label>
                            <hr class="w3-clear w3-col m12">
                            <div class="w3-col m12 " ng-repeat=" answer in answers">
                                <div class="w3-col m3 ">

                                    <div ng-if="VoteAnswer[answer.id]['voted'] == 0">
                                        <button type="button" class="btn li" ng-click="clickUpAnswer(answer.id)">
                                            {{VoteAnswer[answer.id]["countup"]}}
                                        </button>
                                        <button type="button" class="btn li" ng-click="clickDownAnswer(answer.id)">
                                            {{VoteAnswer[answer.id]["countdown"]}}
                                        </button>
                                    </div>
                                    <div ng-if="VoteAnswer[answer.id]['voted'] == 1">
                                        <button type="button" class="btn btn-success li" ng-click="clickUpAnswer(answer.id)">
                                            {{VoteAnswer[answer.id]["countup"]}}
                                        </button>
                                        <button type="button" class="btn li" ng-click="clickDownAnswer(answer.id)">
                                            {{VoteAnswer[answer.id]["countdown"]}}
                                        </button>
                                    </div>
                                    <div ng-if="VoteAnswer[answer.id]['voted'] == 2">
                                        <button type="button" class="btn li" ng-click="clickUpAnswer(answer.id)">
                                            {{VoteAnswer[answer.id]["countup"]}}
                                        </button>
                                        <button type="button" class="btn btn-danger li" ng-click="clickDownAnswer(answer.id)">
                                            {{VoteAnswer[answer.id]["countdown"]}}
                                        </button>
                                    </div>


                                    <div >
                                        <label class="answer">upvote</label>
                                        <label class="answer">downvote</label>
                                    </div>
                                </div>
                                <div class="w3-col m9">

                                    <div class="question-content">{{answer.content}}</div>
                                    <hr class="w3-clear w3-col m12">
                                    <div class="info">
                                        <img ng-src="/imageuser/{{answer.user.id}}" class="w3-left w3-circle w3-margin-right" style="width:30px; margin-right:20px;">
                                        <label style=" margin-left:20px;"><a href="/{{answer.user.id}}">{{answer.user.name}}</a></label>
                                        <label style=" margin-left:20px;">{{answer.time | date : 'hh:mm dd/MM/yyyy' }}</label>
                                        <label class="createby" ng-if="answer.user.email == '${userlogin.email}' || ${isAdmin} == 1">

                                            <a class="btn" data-toggle="modal" data-target="#delModalAnswer"
                                               ng-click="answermodal(answer)">Xóa
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
                                                            <h4>Bạn có muốn xóa câu trả lời này không?</h4>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">&nbsp;Giữ
                                                            </button>
                                                            <button type="button" class="btn btn-default"
                                                                    ng-click="delAnswer()">Xóa
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!--25/4 user co the ua va xoa cau tra loi cua minh-->
                                            <a class="btn" data-toggle="modal" data-target="#editModalAnswer"
                                               ng-click="answermodal(answer)">Sửa
                                            </a>

                                            <div class="modal fade" id="editModalAnswer" role="dialog">
                                                <div class="modal-dialog">

                                                    <!-- Modal content-->
                                                    <div class="modal-content ">
                                                        <div class="modal-body heighta">
                                                            <form name="myForm">
                                                                <div class="input col-sm-12">
                                                                    <div class="col-sm-1"></div>
                                                                    <div class="col-sm-10"><textarea type="text" rows="5" class="form-control" name="aswcontentedit"
                                                                                                     ng-model="AnswereditForm.content"
                                                                                                     ng-minlength="10" ng-maxlength="500"
                                                                                                     ></textarea></div>
                                                                    <div class="col-sm-1"></div>
                                                                </div>
                                                                <div class=" col-sm-12">
                                                                    <div class="col-sm-1"></div>
                                                                    <div class="col-sm-10">
                                                                          <label class="error" ng-show="myForm.aswcontentedit.$error.minlength">
                                                                            <h4>Tiêu đề quá ngắn !! </h4>
                                                                          </label>
                                                                                                    <label class="error" ng-show="myForm.aswcontentedit.$error.maxlength">
                                                                              <h4>Tiêu đề quá dài !! </h4>
                                                                          </label>
                                                                    </div>
                                                                </div>

                                                            </form>
                                                        </div>

                                                        <div class="modal-footer" style="margin-top: 20px">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">&nbsp;Giữ
                                                            </button>
                                                            <button type="button" class="btn btn-default" data-dismiss="modal"
                                                                    ng-click="editAnswer(answer)"
                                                                    ng-disabled="myForm.aswcontentedit.$error.minlength || myForm.aswcontentedit.$error.maxlength|| AnswereditForm.content.length == 0">
                                                                Sửa
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </label>

                                    </div>
                                </div>
                                <hr class="w3-clear w3-col m12">
                            </div>
                            <label class="answers-count">Đăng câu trả lời:</label>
                            <div ng-if="kiemtra == 1 || kiemtra == 3">
                                <form ng-submit="submitAnswer('${userlogin.id}','${userlogin.name}','${userlogin.email}')">
                                    <div class="col-sm-12 input">
                                        <div class="col-sm-3">&nbsp;</div>
                                        <div class="col-sm-7 comment"><textarea minlength="10" maxlength="200" type="text" rows="5" class="form-control"
                                                                                ng-model="AnswerForm.content" required></textarea></div>
                                        <div class="col-sm-2">
                                            <input type="submit" class="btn btn-primary" value="Comment"/>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div ng-if="kiemtra == 2">
                                <div class="col-sm-12 input"><a style="margin-top: 20px; font-size: 20px;" href="/login">Bạn cần đăng nhập để tham gia bình luận</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <!-- End Middle Column -->
        </div>

        <!-- Right Column -->
        <div class="w3-col m2" ng-controller="rightController">
            <div class="w3-card-2 w3-round w3-white w3-center ">
                <div class="w3-container">
                    <div class="questions-count">
                        <p class="p">Questions</p>
                        <p class="number">{{countlistquestion}}</p>
                    </div>
                    <div class="members-count"><p class="p">Members</p>
                        <p class="number">{{countlistuser}}</p>
                    </div>
                </div>
            </div>
            <br>

            <div class="w3-card-2 w3-round w3-white">
                <div class="w3-container">
                    <div style="text-align: center"><H4>HOT QUESTIONS</H4></div>
                    <hr class="w3-clear">
                    <div style="margin-bottom: 25px;" ng-repeat="question in questionsHotMonths">
                        <label class="w3-col m3"><img src="/imageuser/{{question.user.id}}" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:30px; margin-right:10px;"></label>
                        <label class="w3-col m9"><a href="/question/{{question.id_question}}" class="hotquestions">{{question.title}}</a></label>
                    </div>
                </div>
            </div>
            <br>

            <div class="w3-card-2 w3-round w3-white w3-padding-16">
                <div class="w3-container">
                    <div style="text-align: center;"><H4>TOP USER(QUESTIONS)</H4></div>
                    <hr class="w3-clear">
                    <div style="margin-bottom: 25px;" ng-repeat="user in usermanyquestions">
                        <label class="number1">{{$index+1}}</label>
                        <label class="name"><a href="/{{user.id}}">{{user.name}}</a></label>
                        <label class="questions-count-hotuser"><i class="fa fa-question-circle"></i><label style="   margin-left: 3px; min-width: 24px;
              font-size: 14px;
              display: inline-block;">{{listcountquestionbyusers[user.id]}}</label></label>
                    </div>
                </div>
            </div>
            <br>

            <div class="w3-card-2 w3-round w3-white w3-padding-32">
                <div class="w3-container">
                    <div style="text-align: center;"><H4>TOP USER(ANSWERS)</H4></div>
                    <hr class="w3-clear">
                    <div style="margin-bottom: 25px;" ng-repeat="user in usermanyanswers">
                        <label class="number1">{{$index+1}}</label>
                        <label class="name"><a href="/{{user.id}}">{{user.name}}</a></label>
                        <label class="questions-count-hotuser"><i class="fa fa-comments"></i><label style="   margin-left: 3px; min-width: 24px;
              font-size: 14px;
              display: inline-block;">{{listcountanswerbyusers[user.id]}}</label></label>
                    </div>
                </div>
            </div>

            <!-- End Right Column -->
        </div>

        <!-- End Grid -->
    </div>

    <!-- End Page Container -->
</div>
<br>

<!-- Footer -->
<jsp:include page="footer.jsp"/>
<script>
    // Accordion
    function myFunction(id) {
        var x = document.getElementById(id);
        if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
            x.previousElementSibling.className += " w3-theme-d1";
        } else {
            x.className = x.className.replace("w3-show", "");
            x.previousElementSibling.className =
                x.previousElementSibling.className.replace(" w3-theme-d1", "");
        }
    }

    // Used to toggle the menu on smaller screens when clicking on the menu button
    function openNav() {
        var x = document.getElementById("navDemo");
        if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
        } else {
            x.className = x.className.replace(" w3-show", "");
        }
    }
</script>

</body>
</html>
