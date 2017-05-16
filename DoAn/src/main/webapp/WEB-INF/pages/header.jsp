<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div ng-controller="headerController">
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid" style="margin-left: 50px">
            <div class="navbar-header">
                <a  style=" margin-top: 10px;" class="navbar-brand" href="/">ASKME</a>
            </div>
            <form style="margin-left: 25px; margin-top: 15px;" class="navbar-form navbar-left" ng-submit="submitSearch()">
                <div class="form-group">
                    <input type="text" class="form-control" style="width: 300px" placeholder="Search" ng-model="headerForm.search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <div ng-if="kiemtra == 2">
                <ul class="nav navbar-nav" style="margin-left: 40px">
                    <li><a href="/">Home</a></li>
                    <li><a href="/createQuestion">Ask</a></li>
                    <li><a href="/listoftopic">Topics</a></li>
                    <li><a href="/listofuser">Users</a></li>
                    <li><a href="/login">Login</a></li>
                    <li><a href="/registration">Registration</a></li>
                </ul>
            </div>

            <div ng-if="kiemtra == 1">
                <ul class="nav navbar-nav" style="margin-left: 30px">
                    <li><a href="/">Home</a></li>
                    <li><a href="/createQuestion">Ask</a></li>
                    <li><a href="/listoftopic">Topics</a></li>
                    <li><a href="/listofuser">Users</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            {{user.name}}<b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li ><a href="/{{user.id}}">profile</a></li>
                            <li><a href="/logout">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>

            <div ng-if="kiemtra == 3">
                <ul class="nav navbar-nav" style="margin-left: 30px">
                    <li><a href="/">Home</a></li>
                    <li><a href="/createQuestion">Ask</a></li>
                    <li><a href="/listoftopic">Topics</a></li>
                    <li><a href="/listofuser">Users</a></li>
                    <li><a href="/listreports">{{ireport}}-baocao</a></li>
                    <li><a href="/{{user.id}}">{{user.name}}-(Admin)</a></li>
                    <li><a href="/logout">Logout</a></li>
                </ul>
            </div>

        </div>

    </nav>
</div>
