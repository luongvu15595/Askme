<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<title>Trang chủ</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        line-height: 3.3;
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
        word-break: break-all;
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
    .left{margin-left: 14px;}
</style>
<body class="w3-theme-l5" ng-app="Askme" ng-controller="QuestionController">

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
                    <a href="/"><button type="button" class="w3-button w3-block w3-left-align"><i class="fa fa-question-circle fa-fw w3-margin-right"></i>Tất cả câu hỏi</button></a>
                    <a href="/listoftag"><button type="button" class="w3-button w3-block w3-left-align"><i class="fa fa-tags  fa-fw w3-margin-right"></i> Tags</button></a>
                    <a href="/listofuser"><button  type="button" class="w3-button w3-block w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> User</button></a>
                </div>
            </div>

            <br>
            <div class="w3-card-2 w3-round w3-white w3-hide-small">
                <div class="w3-container">
                    <div style="text-align: center; margin-top: 20px"><H4>TOP TAGS</H4></div>
                    <hr class="w3-clear">
                    <div style="margin-bottom: 20px;"ng-repeat="tag in taghots" ><label class="q-tag"><a href="/tag/{{tag.id}}">{{tag.name}}</a></label> x {{countquestionbytags[tag.id]}}</div>
                </div>
            </div>
            <!-- End Left Column -->
        </div>

        <!-- Middle Column -->
        <div class="w3-col m8">

            <div class="w3-row-padding">
                <div class="w3-col m12">
                    <div class="w3-card-2 w3-round w3-white">
                        <div class="w3-container w3-padding">
                            <h3>Tất cả câu hỏi</h3>
                        </div>
                    </div>
                </div>
            </div>


            <div class="w3-container w3-card-2 w3-white w3-round w3-margin" dir-paginate="question in questions|itemsPerPage:8"><br>
                <div class="w3-col m3 ">
                    <div>
                        <span class="li">{{countAnwsers[question.id_question]}}</span>
                        <span class="li">{{countVoteUps[question.id_question]}}</span>
                    </div>
                    <div >
                        <label class="answer">answer</label>
                        <label class="answer">upvote</label>
                    </div>
                </div>
                <div class="w3-col m9">
                    <div><h2 itemprop="name"><a itemprop="url" style="word-wrap: break-word"  ng-href="/question/{{question.id_question}}" class="question-title">{{question.title}}</a></h2></div>
                    <div>

                        <label ng-repeat="i in tags[question.id_question]" class="q-tag">
                            <a ng-href="/tag/{{i.id}}" class="tagtext">{{i.name}}</a>
                        </label>

                    </div>

                    <div class="info">
                        <img src="/imageuser/{{question.user.id}}" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:30px; margin-right:20px;">
                        <label><a href="/{{question.user.id}}">{{question.user.name}}</a></label>
                        <label>, {{question.time | date : 'hh:mm dd/MM/yyyy' }}</label>
                    </div>

                </div>

            </div>
            <label class="left"><dir-pagination-controls
                    min-size="1"
                    max-size="5"
                    direction-links="true"
                    boundary-links="true" >
            </dir-pagination-controls></label>

            <!-- End Middle Column -->
        </div>

        <!-- Right Column -->
        <div class="w3-col m2" ng-controller="rightController">
            <div class="w3-card-2 w3-round w3-white w3-center ">
                <div class="w3-container">
                    <div class="questions-count">
                        <p class="p">Tổng Câu Hỏi</p>
                        <p class="number">{{countlistquestion}}</p>
                    </div>
                    <div class="members-count"><p class="p">Số Thành Viên</p>
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
</body>
</html>
