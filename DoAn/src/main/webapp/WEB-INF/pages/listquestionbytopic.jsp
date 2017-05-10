<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>List Question</title>
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
        h1{
           margin-left: 200px;
        }
    </style>
</head>
<body ng-app="Askme" ng-controller="listquestionbytopicController">
<jsp:include page="header.jsp"/>
<h1>${topic.name}</h1>
<div class="container body ">
<div class="row">
    <table class="table table-striped table1">
        <tbody  ng-init= "getQuestionByTopicData(${topic.id})">

        <tr ng-repeat="question in questionbytopics">
            <td class="labelAnswer" > <div class="count labelAnswer">{{countanswerquestionbytopics[question.id_question]}}
                <br>
                <b>Answer</b>
            </div>
            </td>
            <td class="labelAnswer" > <div class="count labelAnswer">{{countvoteupquestionbytopicdatas[question.id_question]}}
                <br>
                <b>upvote</b>
            </div>
            </td>
            <td>
                <div class="col-sm-12"><a ng-href="/question/{{question.id_question}}">
                    <h4>{{question.title}}</h4>
                </a>
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
</body>
</html>
