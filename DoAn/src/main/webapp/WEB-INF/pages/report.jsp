
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Báo cáo câu hỏi</title>
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
    <link rel="shortcut icon" href="http://example.com/favicon.ico">
    <style type="text/css">
        .bottom{
            margin-bottom: 319px;
        }
    </style>
</head>
<body class="w3-theme-l5" ng-app="Askme" >
<jsp:include  page="header.jsp"/>
<script>
    function myFunction() {
        document.getElementById("SelectReport").disabled = true;
        document.getElementById("textinput").disabled = false;
    }
</script>
<div class="container bottom"  ng-controller="ReportController" ng-init=" selected ='0';
                                                                reports =['bài đăng có nội dung không lành mạnh',
                                                                          'bài đăng không đúng với mục đích của trang web ',
                                                                          'bài đăng có nội dung chống phá nhà nươc',
                                                                          'bài đăng đã bị trùng']
                                                                 " >
    <form ng-submit="submitReport(${idquestion})" name="myForm">
        <div class="col-sm-12 ">  &nbsp; </div>
        <div class="col-sm-12 ">  &nbsp; </div>
        <div class="col-sm-12 ">  &nbsp; </div>
        <div class="col-sm-12 ">  &nbsp; </div>

        <div class="col-sm-12 input">
            <div class="col-sm-3">&nbsp;</div>

            <div class="col-sm-6">
                <div class="form-group" >
                    <label for="SelectReport">Chọn báo cáo : </label>
                    <select id="SelectReport" class="form-control" ng-model="selected" ng-click="visible = false">
                        <option ng-repeat="report in reports" value="{{report}}">{{report}}</option>

                    </select>
                </div>
                <div>
                    <a style="margin-bottom: 30px" ng-click="selected = '1'">Khác : </a>
                </div >
                <div ng-if="selected == '1'">
                    <textarea type="text" rows="4" id="textinput" class="form-control" ng-model="formreport.content"
                              name ="content" ng-minlength="10" ng-maxlength="100" >
                    </textarea>
                </div>
            </div>
        </div>
        <div class="col-sm-12 ">  &nbsp; </div>

        <div class="col-sm-12 ">
            <div class="col-sm-3">&nbsp;</div>
            <div class="col-sm-3">
                <input type="submit" class="btn btn-primary" value="Submit"
                       ng-disabled=" (selected == '1' ) && (myForm.content.$error.minlength || myForm.content.$error.maxlength || formreport.content.length == 0)
                                      || (selected == '0')"/>
            </div>
        </div>
    </form>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
