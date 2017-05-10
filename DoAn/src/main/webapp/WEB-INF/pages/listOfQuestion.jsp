<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html xmlns:th="http://www.thymeleaf.org">
<head>

    <title>listofQuestion</title>

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
        .username{
            font-size: 15px;
        }
        .body{
            margin-top: 3em;
            text-align: justify;
        }

        .tag-group{
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .tagtext{
            color: white;
        }

        .tags{
            margin-right: 7px;
        }
        .count{
            margin-top: 14px;
            font-weight: bold;
        }
        h4{
            font-weight: bold;
            font-size: 23px;
            line-height: 1.46667em;
            display: block;
        }
        .labelAnswer{
            width: 70px;
        }
        .table1{
            margin-left: 15px;
        }
    </style>
</head>
<body ng-app="Askme">
<jsp:include page="header.jsp"/>
<div class="container body" ng-controller="QuestionController">
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#listQuestion">Câu Hỏi</a></li>
        <li><a data-toggle="tab" href="#HotWeek">Hot Tuần</a></li>
        <li><a data-toggle="tab" href="#HotMonth">Hot Tháng</a></li>
    </ul>

    <div class="tab-content">
        <div id="listQuestion" class="tab-pane fade in active">
            <div class="row">
            <table class="table table-striped table1">
            <tbody>

            <tr  ng-repeat="question in questions">
            <td class="labelAnswer"> <div class="count labelAnswer">{{countAnwsers[question.id_question]}}
            <br>
            <b>Answer</b>
            </div>
            </td>
                <td class="labelAnswer"> <div class="count">{{countVoteUps[question.id_question]}}
                    <br>
                    <b>VoteUp</b>
                </div>
                </td>
            <td>
            <div class="col-sm-12"><a ng-href="/question/{{question.id_question}}">
            <h4>{{question.title}}</h4>
            </a>
            </div>

            <div class="col-sm-12 tag-group">
            <span ng-repeat="i in topics[question.id_question]" class="btn-sm btn-warning tags">
            <a ng-href="/topic/{{i.id}}" class="tagtext">{{i.name}}</a>
            </span>
            </div>
            <div class="col-sm-12 username">
            <span><i><a href="/{{question.user.id}}">{{question.user.name}}</a></i></span>
            <span><i>,{{question.time | date : 'hh:mm:ss dd/MM/yyyy' }}</i></span></div>
            </td>

            </tr>
            </tbody>
            </table>
            </div>
        </div>
        <div id="HotWeek" class="tab-pane fade">
            <div class="row">
                <table class="table table-striped table1">
                    <tbody>

                    <tr ng-repeat="questionsHotWeek in questionsHotWeeks">
                        <td class="labelAnswer"> <div class="count">{{countAnwserHotWeeks[questionsHotWeek.id_question]}}
                            <br>
                            <b>Answer</b>
                        </div>
                        </td>
                        <td class="labelAnswer"> <div class="count">{{countVoteUpHotWeeks[questionsHotWeek.id_question]}}
                            <br>
                            <b>VoteUp</b>
                        </div>
                        </td>

                        <td>
                            <div class="col-sm-12"><a ng-href="/question/{{questionsHotWeek.id_question}}">
                                <h4>{{questionsHotWeek.title}}</h4>
                            </a>
                            </div>


                            <div class="col-sm-12 tag-group">
            <span ng-repeat="i1 in topicHotWeeks[questionsHotWeek.id_question]" class="btn-sm btn-warning tags">
            <a ng-href="/topic/{{i1.id}}" class="tagtext">{{i1.name}}</a>
            </span>
                            </div>
                            <div class="col-sm-12 username">
                                <span><i><a href="/{{questionsHotWeek.user.id}}">{{questionsHotWeek.user.name}}</a></i></span>
                                <span><i>,{{questionsHotWeek.time | date : 'hh:mm:ss dd/MM/yyyy' }}</i></span></div>
                        </td>

                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div id="HotMonth" class="tab-pane fade">
            <div class="row">
                <table class="table table-striped table1">
                    <tbody>

                    <tr ng-repeat="questionsHotMonth in questionsHotMonths">
                        <td class="labelAnswer"> <div class="count">{{countAnwserHotMonths[questionsHotMonth.id_question]}}
                            <br>
                            <b>Answer</b>
                        </div>
                        </td>

                        <td class="labelAnswer"> <div class="count">{{countVoteUpHotMonths[questionsHotMonth.id_question]}}
                            <br>
                            <b>VoteUp</b>
                        </div>
                        </td>

                        <td>
                            <div class="col-sm-12"><a ng-href="/question/{{questionsHotMonth.id_question}}">
                                <h4>{{questionsHotMonth.title}}</h4>
                            </a>
                            </div>


                            <div class="col-sm-12 tag-group">
            <span ng-repeat="i2 in topicHotMonths[questionsHotMonth.id_question]" class="btn-sm btn-warning tags">
            <a ng-href="/topic/{{i2.id}}" class="tagtext">{{i2.name}}</a>
            </span>
                            </div>
                            <div class="col-sm-12 username">
                                <span><i><a href="/{{questionsHotMonth.user.id}}">{{questionsHotMonth.user.name}}</a></i></span>
                                <span><i>,{{questionsHotMonth.time | date : 'hh:mm:ss dd/MM/yyyy' }}</i></span></div>
                        </td>

                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
