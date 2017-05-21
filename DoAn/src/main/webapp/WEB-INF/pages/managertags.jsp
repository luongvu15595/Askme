<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>quản lý Tags</title>
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
        .width{
            width: 800px;
            margin-top: 20px;
            margin-left: 133px;
        }
    </style>
</head>
<body ng-app="Askme" ng-controller="managertag">
<jsp:include page="header.jsp"/>
<div class="container">
    <h2>Quản lý Tags</h2>
    <form class="form-inline">
        <div class="form-group">
            <label >Search</label>
            <input type="text" ng-model="search" class="form-control" placeholder="Search">
        </div>
    </form>
    <table class="table table-bordered width">
        <thead>
        <tr class="color">
            <th class="id">ID</th>
            <th>Tên</th>
            <th>So cau hoi chua tag</th>
            <th class="del"></th>
        </tr>
        </thead>
        <tbody>
        <tr  dir-paginate="tag in tags|filter:search |itemsPerPage:10">
            <td>{{tag.id}}</td>
            <td>{{tag.name}}</td>
            <td>{{countquestionbytags[tag.id]}}</td>
            <td>
                <button type="button" class="btn btn-danger" ng-click="delTagModal(tag)" data-toggle="modal" data-target="#delModalQuestion">
                    Xoa
                </button></td>
            <div class="modal fade" id="delModalQuestion" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title">{{tag.name}}</h3>
                        </div>
                        <div class="modal-body">
                            <h4>Bạn Muốn xóa bỏ {{tag.name}} </h4>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">&nbsp;Giữ
                            </button>
                            <button type="button" class="btn btn-default" data-dismiss="modal"
                                    ng-click="delTag()">Xóa
                            </button>
                        </div>
                    </div>
                </div>
            </div>

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
</body>
</html>

