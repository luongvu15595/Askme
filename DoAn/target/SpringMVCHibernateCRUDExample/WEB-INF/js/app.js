var Askme = angular.module("Askme", []);
//page header
Askme.controller("headerController", function ($scope, $http) {
    $scope.kiemtra = 0;
    $scope.user = "";
    $scope.headerForm = {
        search: ""
    };
    checkdangnhap();
    test();

    //kiem tra dang nhap
    function checkdangnhap() {
        $http({
            method: 'GET',
            url: 'http://localhost:8080/testthu'
        }).then(function successCallback(response) {
            $scope.kiemtra = response.data;
        }), function errorCallback(response) {
            console.log(response.statusText);
        }
    };
    function test() {
        $http({
            method: 'GET',
            url: 'http://localhost:8080/testabc'
        }).then(function successCallback(response) {
            $scope.user = response.data;
        }), function errorCallback(response) {
            console.log(response.statusText);
        }
    };
    $scope.submitSearch = function () {
        var name = "/search/" + $scope.headerForm.search;
        location.href = name;
    };


});
//page listOfQuestion
Askme.controller("QuestionController", function ($scope, $http) {
    $scope.questions = [];
    _refreshQuestionData();
    function _refreshQuestionData() {
        $http({
            method: 'GET',
            url: 'http://localhost:8080/getAllQuestion'
        }).then(function successCallback(response) {
            $scope.questions = response.data;
//            }), function errorCallback(response) {
//                console.log(response.statusText);
//            }
        })
    }

    var countAnswer = {
        method: 'GET',
        url: 'http://localhost:8080/getcount'
    };
    $http(countAnswer).success(
        function (data) {
            $scope.countAnwsers = data;
        }
    );

    var topic = {
        method: 'GET',
        url: 'http://localhost:8080/getAllTopicByQuestion'
    };
    $http(topic).success(
        function (data) {
            $scope.topics = data;
        }
    );
});
// page listoftopic
Askme.controller("listOfTopicController", function ($scope, $http) {
    $scope.topics = [];
    _refreshTopicData();
    function _refreshTopicData() {
        $http({
            method: 'GET',
            url: 'http://localhost:8080/listtopic'
        }).then(function successCallback(response) {
            $scope.topics = response.data;
        }), function errorCallback(response) {
            console.log(response.statusText);
        }
    };
});
//pages answerByUser
Askme.controller("answerByUserController",function ($scope,$http) {
    $scope.answers=[];
    _getQuestionByUser();

    function _getQuestionByUser() {
        $http({
            method: 'GET',
            url: 'http://localhost:8080/getAllAnswerByUser/${user.id}'
        }).then(function successCallback(response) {
            $scope.answers = response.data;
        }), function errorCallback(response) {
            console.log(response.statusText);
        }

    }
});
//page CreateQuestion

//page editQuestion
Askme.controller("editQuestionController", function ($scope, $http) {
    $scope.questionForm ={
        content : "",
        image:"",
        title:"",
        id_question:"",
    }
    $scope.questionForm.content = "${questionFormUpdate.content}";
    $scope.questionForm.title="${questionFormUpdate.title}";
    $scope.questionForm.image="${questionFormUpdate.image}";
    $scope.questionForm.id_question ="${questionFormUpdate.id_question}";



    $scope.submitUpdateQuestion = function () {
        $http({
            method: "PUT",
            url: "http://localhost:8080/updatequestion",
            data: angular.toJson($scope.questionForm),
            headers: {
                'Content-Type': 'application/json'
            }
        })
    };
});

//page listquestionbytopic
Askme.controller("listquestionbytopicController", function ($scope, $http) {
    $scope.questions = [];
    _getQuestionByTopicData();

    function _getQuestionByTopicData() {
        $http({
            method: 'GET',
            url: 'http://localhost:8080/getAllQuestionByidTopic/${topic.id}'
        }).then(function successCallback(response) {
            $scope.questions = response.data;
        }), function errorCallback(response) {
            console.log(response.statusText);
        }

    };

});
//listUser

//login
Askme.controller("LoginController",function () {
});

//profile
Askme.controller("profile",function () {
});

//registration
Askme.controller("RegisterController",function () {
});

//search
Askme.controller("searchquestionController",function ($scope,$http) {
    $scope.questions=[];
    _getQuestionByUser();
    $scope.checkquestion=0;
    checkquestion1();

    function _getQuestionByUser() {
        $http({
            method: 'GET',
            url: 'http://localhost:8080/listsearchQuestion/${string}'
        }).then(function successCallback(response) {
            $scope.questions = response.data;
        }), function errorCallback(response) {
            console.log(response.statusText);
        }

    }
    function checkquestion1() {
        $http({
            method: 'GET',
            url: 'http://localhost:8080//checksearchQuestion/${string}'
        }).then(function successCallback(response) {
            $scope.checkquestion = response.data;
        }), function errorCallback(response) {
            console.log(response.statusText);
        }
    };
});

//list question by user
