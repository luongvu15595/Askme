<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>Đổi mật khẩu</title>
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
        .top{
            margin-top: 30px;
        }
        .tag-template div:first-child {
            float: left;
        }

        .tag-template div:first-child img {
            width: 24px;
            height: 24px;
            vertical-align: middle;
        }

        .tag-template div:last-child {
            float: left;
            margin-left: 5px;
        }
        .email{
            margin-top: 30px;
        }
        .message{
            color: red;
        }
        .message1{
            color: green;
        }
        .bottom{
            margin-bottom: 204px;
        }
    </style>
</head>
<body class="w3-theme-l5" ng-app="Askme" ng-controller="ChangePasswordController">
<jsp:include page="header.jsp"/>
<div class="container bottom">
    <div class="row top">
        <form accept-charset="UTF-8" ng-submit="submitPassword()" enctype="multipart/form-data">
            <div class="col-md-4">&nbsp;</div>
            <div class="form-group col-md-4">
            <div class="email"><input class="form-control" type="password" ng-model="changePassword" placeholder="mật khẩu cũ" minlength="8" maxlength="20" required></div>
            <div class="email"><input class="form-control" type="password" ng-model="newPassword"  placeholder="mật khẩu mới" minlength="8" maxlength="20" required></div>
            <div class="email"><input class="form-control" type="password" ng-model="renewPassword" placeholder=" nhập lại mật khẩu " minlength="8" maxlength="20" required></div>
            <div class="email"><input  type="submit" class="btn btn-lg btn-primary btn-block" value="Đổi mật khẩu"/></div>
            <div class="email">
                <div><p class="message">{{message3}}</p></div>
                <div><p class="message">{{message2}}</p></div>
                <div><p class="message1">{{message1}}</p></div>
            </div>
            </div>

        </form>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
