<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<header>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</header>
<body>
<form action="/createTopicQuestion" method="POST" accept-charset="UTF-8">
    First Name: <input type="text" name="name">
    <br />
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <input type="submit" value="Submit" />
</form>
</body>
</html>