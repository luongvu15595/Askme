<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div ng-controller="headerController">
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="/">ASKME</a>
            </div>
            <form class="navbar-form navbar-left" ng-submit="submitSearch()">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search" ng-model="headerForm.search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <div ng-if="kiemtra == 2">
                <ul class="nav navbar-nav">
                    <li><a href="/">Home</a></li>
                    <li><a href="/createQuestion">Ask</a></li>
                    <li><a href="/listoftopic">Topics</a></li>
                    <li><a href="/listofuser">Users</a></li>
                    <li><a href="/login">Login</a></li>
                    <li><a href="/registration">Registration</a></li>
                </ul>
            </div>

            <div ng-if="kiemtra == 1">
                <ul class="nav navbar-nav">
                    <li><a href="/">Home</a></li>
                    <li><a href="/createQuestion">Ask</a></li>
                    <li><a href="/listoftopic">Topics</a></li>
                    <li><a href="/listofuser">Users</a></li>
                    <li><a href="/">{{user.name}}</a></li>
                    <li><a href="/logout">Logout</a></li>
                </ul>
            </div>

            <div ng-if="kiemtra == 3">
                <ul class="nav navbar-nav">
                    <li><a href="/">Home</a></li>
                    <li><a href="/createQuestion">Ask</a></li>
                    <li><a href="/listoftopic">Topics</a></li>
                    <li><a href="/listofuser">Users</a></li>
                    <li><a href="/listreports">{{ireport}}-baocao</a></li>
                    <li><a href="/">{{user.name}}-(Admin)</a></li>
                    <li><a href="/logout">Logout</a></li>
                </ul>
            </div>

        </div>

    </nav>
</div>
