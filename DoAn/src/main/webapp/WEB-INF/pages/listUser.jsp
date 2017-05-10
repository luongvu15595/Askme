<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns:th="http://www.thymeleaf.org">
<head>

    <title>List User</title>
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

        .right{
            float: right;
        }
        .center{
            margin-top: 5px;
        }
    </style>
</head>
<body ng-app="Askme" ng-controller="listUser">
<jsp:include page="header.jsp"/>
<div class="container">
    <table class="table table-striped">
        <tbody>
        <tr ng-repeat="user in users">

            <td>
                <span><a ng-href="/{{user.id}}"><h4>{{user.name}}</h4></a></span>
                <span ng-if="kiemtra == 1|| kiemtra == 3">
                    <span ng-if="following[user.id]['following'] == 1">
                        <button type="button" class="btn btn-success" ng-click="clickfollowing(user.id)">
                            following
                        </button>
                    </span>
                    <span ng-if="following[user.id]['following'] == 0">
                        <button type="button" class="btn" ng-click="clickfollowing(user.id)">
                            following
                        </button>
                    </span>
                </span>
                <span ng-if="kiemtra == 3">
                     <button type="button" class="btn" data-toggle="modal" data-target="#delModalQuestion">
                        Xoa
                    </button>
                    <div class="modal fade" id="delModalQuestion" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3 class="modal-title"> {{user.name}}</h3>
                                </div>
                                <div class="modal-body">
                                    <h4>Xoa bo nguoi dung ??</h4>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">&nbsp;Giu
                                    </button>
                                        <button type="button" class="btn btn-default"
                                                ng-click="delUser(user)">Xoa
                                        </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </span>
            </td>

        </tr>
        </tbody>
    </table>
</div>
</body>
</html>
