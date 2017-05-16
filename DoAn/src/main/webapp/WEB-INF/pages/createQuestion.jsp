
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>Create Question</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://mbenford.github.io/ngTagsInput/css/ng-tags-input.min.css" />
    <script src="http://mbenford.github.io/ngTagsInput/js/ng-tags-input.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/angular-ui-bootstrap/0.11.0/ui-bootstrap-tpls.js"></script>
    <script src="/js/dirPagination.js"></script>
    <script src="/js/app.js"></script>
    <style type="text/css">
        .top{
            margin-top: 10px;
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
        .tag{
            height: 40px;
        }
        .lable{
            margin-top: 4px;
        }
        p{
            color: red;
            font-size: 15px;
        }
    </style>
</head>
<body ng-app="Askme" ng-controller="CreateQuestionController">
<jsp:include page="header.jsp"/>
<div class="container">
    <form accept-charset="UTF-8" ng-submit="submitQuestion()" enctype="multipart/form-data">
        <div class="row">
            <div class="form-group col-sm-10 top ">
                <span class="col-sm-1"><label >Title:</label></span>
                <span class="col-sm-9"><input type="text" minlength="10" maxlength="100" class="form-control" ng-model="questionForm.title" required></span>
            </div>

            <div class="form-group col-sm-10">
                <span class="col-sm-1"><label>Content:</label></span>
                <span class="col-sm-9"><textarea type="text" rows="10" minlength="10" maxlength="500" class="form-control" ng-model="questionForm.content" required></textarea></span>
            </div>
            <%--//  25/4--%>
            <div class="form-group col-sm-10">
                <span class="col-sm-1"><label>Browse:</label></span>
                <span class="col-sm-9"><input type="file"  file-model="myFile" hidden></span>
            </div>

            <div class="form-group col-sm-10">
                <span class="col-sm-1 lable"><label>Topic:</label></span>
                <span class="col-sm-9 tag"><tags-input ng-model="tags"
                            display-property="name"
                            placeholder="Add topic"
                            replace-spaces-with-dashes="false">
                    <auto-complete source="loadTags($query)"
                                   min-length="0"
                                   load-on-focus="true"
                                   load-on-empty="true"
                                   max-results-to-show="32"
                                   template="my-custom-template"

                    ></auto-complete>
                </tags-input></span>

            </div>

            <div class="form-group col-sm-10">
                <span class="col-sm-7"></span>
                <span class="col-sm-3"><input type="submit" class="btn btn-lg btn-primary btn-block" value="Submit"/></span>
            </div>
            <div class="form-group col-sm-10">
                <p style="margin-left: 5px">{{statussubmit}}</p>
                <p style="margin-left: 5px">{{message}}</p></div>
        </div>
    </form>
</div>
<script type="text/ng-template" id="my-custom-template">
    <div class="right-panel">
        <span ng-bind-html="$highlight($getDisplayText())"></span>
    </div>
</script>
<jsp:include page="footer.jsp"/>
</body>
</html>
