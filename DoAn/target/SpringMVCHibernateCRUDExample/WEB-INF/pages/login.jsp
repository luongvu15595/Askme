<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
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
    </style>
    <title>Log in</title>

</head>

<body>
<jsp:include page="header.jsp"/>
<h2>LOGIN</h2>
<div class="container">
    <div class="row">
        <form method="POST" action="/j_spring_security_check" class="form-signin">
            <div class="col-md-4">&nbsp;</div>
            <div class="form-group col-md-4 ${error != null ? 'has-error' : ''}">
                <span>${message}</span>
                <div class="email"><input name="email" type="text" class="form-control" placeholder="email"
                    autofocus="true"/></div>
                <div class="top"><input name="password" type="password" class="form-control" placeholder="Password"/></div>
                <span>${error}</span>
                <div class="top"><button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button></div>
            </div>
    </div>
    </form>

</div>
</body>
</html>

