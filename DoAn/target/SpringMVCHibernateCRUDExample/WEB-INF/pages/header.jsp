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

                <ul class="nav navbar-nav">
                    <li><a href="/">Home</a></li>
                    <li><a href="/createQuestion">Ask</a></li>
                    <li><a href="/listoftopic">Topics</a></li>
                    <li><a href="/listofuser">Users</a></li>
                    <span ng-if="kiemtra == 2">
                    <li><a href="/login">Login</a></li>
                    <li><a href="/registration">Registration</a></li>
                    </span>
                </ul>


            <div ng-if="kiemtra == 1">
                <ul class="nav navbar-nav">
                    <li><a href="/">Home</a></li>
                    <li><a href="/createQuestion">Ask</a></li>
                    <li><a href="/listoftopic">Topics</a></li>
                    <li><a href="/listofuser">Users</a></li>
                    <span class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                            {{user}}
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                            <li><a href="/logout">Logout</a></li>
                        </ul>
                    </span>
                </ul>
            </div>

        </div>

    </nav>
</div>
