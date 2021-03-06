<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng kí</title>
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

            text-align: center;
            margin-top: 100px;
        }
        .formrow{
            margin-top: 20px;
        }
        .bottom{
            margin-bottom: 107px;
        }
    </style>


</head>

<body class="w3-theme-l5" ng-app="Askme" ng-controller="RegisterController">
<jsp:include page="header.jsp"/>
<div class="container bottom" >
    <div class="row " >

    <form:form method="POST" modelAttribute="userForm" class="form-signin">
        <h2 class="form-signin-heading">Đăng kí tài khoản</h2>
        <div class="col-md-4">&nbsp;</div>
        <div class="form-group col-md-4">
        <spring:bind path="email">
            <div class="formrow ${status.error ? 'has-error' : ''} ">
                <form:input type="email" path="email" class="form-control" placeholder="Email"
                            autofocus="true"></form:input>
                <form:errors path="email"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="name">
            <div class="formrow ${status.error ? 'has-error' : ''} ">
                <form:input type="text" path="name" class="form-control" placeholder="Họ và tên"
                            autofocus="true"></form:input>
                <form:errors path="name"></form:errors>
            </div>

        </spring:bind>


        <spring:bind path="password">
            <div  class="formrow ${status.error ? 'has-error' : ''} ">
                <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
                <form:errors path="password"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="passwordConfirm">
            <div class="formrow ${status.error ? 'has-error' : ''} ">
                <form:input type="password" path="passwordConfirm" class="form-control"
                            placeholder="Nhập lại password"></form:input>
                <form:errors path="passwordConfirm"></form:errors>
            </div>
        </spring:bind>

        <button class="btn btn-lg btn-primary btn-block formrow" type="submit">Đăng kí</button>
        </div>
    </form:form>

</div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
