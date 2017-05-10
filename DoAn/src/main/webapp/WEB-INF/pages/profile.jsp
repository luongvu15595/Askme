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
        .toptabs{
            margin-top: 30px;
        }
        .topcontent{
            margin-top: 50px;
        }
        .top{
            margin-top: 10px;
        }

        .image{
            width: 150px;
        }
        .center{
            margin-top: 25px;
        }
        .information{
            width: 820px;
            float: right;
            height: 150px;
            margin-bottom: 50px;
        }
    </style>
</head>
<body ng-app="Askme" ng-controller="profile">
<jsp:include page="header.jsp"/>
<div class="container body" ng-controller="QuestionController">
    <div class="row">
        <ul class="nav nav-tabs toptabs">
            <li class="active"><a data-toggle="tab" href="#profile">thông tin cá nhân</a></li>
            <li><a data-toggle="tab" href="#active">Hoạt động</a></li>
            <li><a data-toggle="tab" href="#editprofile">sửa thông tin cá nhân</a></li>
        </ul>

        <div class="tab-content topcontent">
            <div id="profile" class="tab-pane fade in active center">
                <span class="image"><img src="/imageuser/${user.id}" width="150px" height="150px"/></span>
                <span class="information">
                <div>
                    <h1>${user.name}</h1>
                </div>
                <div class="top">
                    ${user.email}
                </div>
                <div class="top">
                    <a href="/changepass">đổi mật khẩu</a>
                </div>
                </span>
            </div>
            <div id="active" class="tab-pane fade">
                <h2><a href="/${user.id}/question">Questions(${question})</a></h2>
                <h2><a href="/${user.id}/answer">Answers(${answer})</a></h2>
            </div>
            <div id="editprofile" class="tab-pane fade">
            </div>
        </div>
    </div>
</div>
</body>
</html>
