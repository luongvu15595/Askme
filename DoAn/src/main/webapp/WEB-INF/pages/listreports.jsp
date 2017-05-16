<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/3/2017
  Time: 1:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reports</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
    <link rel="stylesheet" href="http://mbenford.github.io/ngTagsInput/css/ng-tags-input.min.css" />
    <script src="http://mbenford.github.io/ngTagsInput/js/ng-tags-input.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/angular-ui-bootstrap/0.11.0/ui-bootstrap-tpls.js"></script>
    <script src="/js/dirPagination.js"></script>
    <script src="/js/app.js"></script>
    <style>
        .color{
            background: #0000ff;
            color: white;
        }
        .id{
            width: 40px;
        }
        .del{
            width: 50px;
        }

    </style>

</head>
<body ng-app="Askme" >
<jsp:include page="header.jsp"/>
<div class="container" ng-controller="listReports">
    <h2>Quản lý Report</h2>
    <form class="form-inline">
        <div class="form-group">
            <label >Search</label>
            <input type="text" ng-model="search" class="form-control" placeholder="Search">
        </div>
    </form>
    <table class="table table-bordered">
        <thead>
        <tr class="color">
            <th class="id">Người report</th>
            <th class="id">Người đăng bài </th>
            <th>Nội dung bài đăng</th>
            <th>Nội dung report</th>
            <th class="del">trạng thái xử lý</th>
        </tr>
        </thead>
        <tbody>
        <tr dir-paginate="report in reports|filter:search|itemsPerPage:5">
            <td>{{report.user.name}}</td>
            <td>{{report.question.user.name}}</td>
            <td><a ng-href="/question/{{report.question.id_question}}">{{report.question.title}}</a></td>
            <td>{{report.content}}</td>
            <td ng-if="statusreports[report.id] == 0">
                <button type="button" class="btn btn-warning" ng-click="cancel(report.id)">cancel</button>
            </td>
            <td ng-if="statusreports[report.id] == 1"><label class="btn btn-success">Đã xử lý</label> </td>
        </tr>
        </tbody>
    </table>
    <dir-pagination-controls
            min-size="1"
            max-size="5"
            direction-links="true"
            boundary-links="true" >
    </dir-pagination-controls>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>
