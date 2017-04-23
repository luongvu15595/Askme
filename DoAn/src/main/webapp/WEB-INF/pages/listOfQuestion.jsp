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
    </style>
</head>
<body ng-app="Askme">
<jsp:include page="header.jsp"/>
<div class="container body" ng-controller="QuestionController">
    <div class="row">
    <table class="table table-striped">
        <tbody>

        <tr ng-repeat="question in questions">
            <td> <div class="count">{{countAnwsers[question.id_question]}}
                <br>
                <b>Answer</b>
            </div>
            </td>

            <td>
                <div class="col-sm-12"><a ng-href="/question/{{question.id_question}}">
                      <h4>{{question.title}}</h4>
                    </a>
                </div>

                <div ng-init="list= topics[question.id_question] "></div>
                <div class="col-sm-12 tag-group">
                <span ng-repeat="i in list" class="btn-sm btn-warning tags">
                    <a ng-href="/topic/{{i.id}}" class="tagtext">{{i.name}}</a>
                </span>
                </div>
                <div class="col-sm-12 username">
                    <span><i><a href="/{{question.user.id}}">{{question.user.name}}</a></i></span>
                    <span><i>,{{question.time | date : 'yyyy/MM/dd' }}</i></span></div>
            </td>

        </tr>
        </tbody>
    </table>
</div>
</div>
</body>
</html>
