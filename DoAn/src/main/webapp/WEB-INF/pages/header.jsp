<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div ng-controller="headerController">
    <nav class="navbar navbar-inverse">
        <div class="container-fluid" style="margin-left: 110px">
            <div class="navbar-header">
                <a  style=" margin-top: 6px; font-size: 40px" class="navbar-brand" href="/">ASKME</a>
            </div>
            <form style="margin-left: 25px; margin-top: 15px;" class="navbar-form navbar-left" ng-submit="submitSearch()">
                <div class="form-group">
                    <input type="text" class="form-control" style="width: 300px" placeholder="Search" ng-model="headerForm.search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <div ng-if="kiemtra == 2">
                <ul class="nav navbar-nav" style="margin-left: 40px">
                    <li><a href="/">Trang chủ</a></li>
                    <li><a href="/createQuestion">Hỏi</a></li>
                    <li><a href="/listoftag">Tags</a></li>
                    <li><a href="/listofuser">Users</a></li>
                    <li><a href="/login">Đăng nhập</a></li>
                    <li><a href="/registration">Đăng kí</a></li>
                </ul>
            </div>

            <div ng-if="kiemtra == 1">
                <ul class="nav navbar-nav" style="margin-left: 30px">
                    <li><a href="/">Trang chủ</a></li>
                    <li><a href="/createQuestion">Hỏi</a></li>
                    <li><a href="/listoftag">Tags</a></li>
                    <li><a href="/listofuser">Users</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            {{user.name}}<b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li ><a style="width: 160px;" href="/{{user.id}}">profile</a></li>
                            <li><a style="width: 160px;" href="/logout">Đăng xuất</a></li>
                        </ul>
                    </li>
                </ul>
            </div>

            <div ng-if="kiemtra == 3">
                <ul class="nav navbar-nav" style="margin-left: 30px">
                    <li><a href="/">Trang chủ</a></li>
                    <li><a href="/createQuestion">Hỏi</a></li>
                    <li><a href="/listoftag">Tags</a></li>
                    <li><a href="/listofuser">Users</a></li>
                    <li><a href="/manageruser">quanlyuser</a></li>
                    <li><a href="/managertags">quantytags</a></li>
                    <li><a href="/listreports">{{ireport}}-baocao</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            {{user.name}}-(Admin)<b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li ><a style="width: 160px;" href="/{{user.id}}">profile</a></li>
                            <li><a style="width: 160px;" href="/logout">Đăng xuất</a></li>
                        </ul>
                    </li>
                </ul>
            </div>

        </div>

    </nav>
</div>
