<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
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
    <style type="text/css">
        html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
        h2{
            color:blue;
            text-align: center;
            margin-top: 120px;
        }
        .email{
            margin-top: 30px;
        }
        .top{
            margin-top: 30px;
        }
        .bottom{
            margin-bottom: 185px;
        }
    </style>
    <title>Đăng nhập</title>

</head>

<body  class="w3-theme-l5" ng-app="Askme" ng-controller="LoginController">
<jsp:include page="header.jsp"/>
<h2>Đăng nhập</h2>
<div class="container bottom">
    <div class="row">
        <form method="POST" action="/j_spring_security_check" class="form-signin">
            <div class="col-md-4">&nbsp;</div>
            <div class="form-group col-md-4 ${error != null ? 'has-error' : ''}">
                <span>${message}</span>
                <div class="email"><input name="email" type="text" class="form-control" placeholder="Email"
                    autofocus="true"/></div>
                <div class="top"><input name="password" type="password" class="form-control" placeholder="Password"/></div>
                <span>${error}</span>
                <div class="top"><button class="btn btn-lg btn-primary btn-block" type="submit">Đăng nhập</button></div>
            </div>
        </form>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>

