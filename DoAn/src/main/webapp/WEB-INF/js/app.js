var Askme = angular.module("Askme", ['ngTagsInput']);
//page header
Askme.controller("headerController", function ($scope, $http) {
    $scope.kiemtra = 0;
    $scope.user = "";
    $scope.ireport=0;
    $scope.headerForm = {
        search: ""
    };
    checkdangnhap();
    test();
    ireport();
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
    //3-5 tra ve so long report
    function ireport() {
        $http({
            method: 'GET',
            url: 'http://localhost:8080/ireport'
        }).then(function successCallback(response) {
            $scope.ireport = response.data;
        });
    };
    $scope.submitSearch = function () {
        var name = "/search/" + $scope.headerForm.search;
        location.href = name;
    };


});
//page listOfQuestion
Askme.controller("QuestionController", function ($scope, $http) {
    $scope.questions = [];
    $scope.questionsHotWeeks=[];
    $scope.questionsHotMonths=[];

    _refreshQuestionData();
    _refreshQuestionHotWeekData();
    _refreshQuestionHotMonthData();

    function _refreshQuestionData() {
        $http({
            method: 'GET',
            url: 'http://localhost:8080/getAllQuestion'
        }).then(function successCallback(response) {
            $scope.questions = response.data;

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

    var countVoteUp = {
        method: 'GET',
        url: 'http://localhost:8080/countvoteup'
    };
    $http(countVoteUp).success(
        function (data) {
            $scope.countVoteUps = data;
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

    function _refreshQuestionHotWeekData() {
        $http({
            method: 'GET',
            url: 'http://localhost:8080/listquestionhotweek'
        }).then(function successCallback(response) {
            $scope.questionsHotWeeks = response.data;
        })
    }

    var countAnswerHotWeek = {
        method: 'GET',
        url: 'http://localhost:8080/countanswerofquestionhotweek'
    };
    $http(countAnswerHotWeek).success(
        function (data) {
            $scope.countAnwserHotWeeks = data;
        }
    );

    var countVoteUpHotWeek = {
        method: 'GET',
        url: 'http://localhost:8080/countvoteuphotweek'
    };
    $http(countVoteUpHotWeek).success(
        function (data) {
            $scope.countVoteUpHotWeeks = data;
        }
    );

    var topicHotWeek = {
        method: 'GET',
        url: 'http://localhost:8080/topicQuestionHotWeek'
    };
    $http(topicHotWeek).success(
        function (data) {
            $scope.topicHotWeeks = data;
        }
    );

    function _refreshQuestionHotMonthData() {
        $http({
            method: 'GET',
            url: 'http://localhost:8080/listquestionhotmonth'
        }).then(function successCallback(response) {
            $scope.questionsHotMonths = response.data;
        })
    }

    var countAnswerHotMonth = {
        method: 'GET',
        url: 'http://localhost:8080/countanswerofquestionhotmonth'
    };
    $http(countAnswerHotMonth).success(
        function (data) {
            $scope.countAnwserHotMonths = data;
        }
    );

    var countVoteUpHotMonth = {
        method: 'GET',
        url: 'http://localhost:8080/countvoteuphotmonth'
    };
    $http(countVoteUpHotMonth).success(
        function (data) {
            $scope.countVoteUpHotMonths = data;
        }
    );

    var topicHotMonth = {
        method: 'GET',
        url: 'http://localhost:8080/topicQuestionHotmonth'
    };
    $http(topicHotMonth).success(
        function (data) {
            $scope.topicHotMonths = data;
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
    var countquestionbytopic = {
        method: 'GET',
        url: 'http://localhost:8080/countquestionbytopic'
    };
    $http(countquestionbytopic).success(
        function (data) {
            $scope.countquestionbytopics = data;
        }
    );

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
Askme.directive('fileModel', ['$parse', function ($parse) {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            var model = $parse(attrs.fileModel);
            var modelSetter = model.assign;

            element.bind('change', function(){
                scope.$apply(function(){
                    modelSetter(scope, element[0].files[0]);
                });
            });
        }
    };
}]);
Askme.controller("CreateQuestionController", function ($scope, $http) {
    $scope.questionForm = {
        title: "",
        content: "",
        image: ""

    };
    $scope.tagForm = {
        name: ""
    };
    $scope.tags = [];
    $scope.count1 = 0;
    $scope.loadTags = function($query) {
        return $http({
            method: 'GET',
            url: 'http://localhost:8080/listtopic'
        }).then(function successCallback(response) {
           var topics = response.data;
            return topics.filter(function(topic) {
                return topic.name.toLowerCase().indexOf($query.toLowerCase()) != -1;
            });
         })
    };
    $scope.reset = function () {
        $scope.questionForm.title = "";
        $scope.questionForm.content = "";
        $scope.questionForm.image = "";

    };

    $scope.submitQuestion = function () {
        var file = $scope.myFile;
        var name = "/createQuestion";
        var fd = new FormData;
        console.log($scope.tags.length + "hello");

        for(var i =0; i<$scope.tags.length;i++){
            if ($scope.tags[i].name.length > 20){
                $scope.count1 = 1;
                break;
            }
            else {$scope.count1 = 0;}
        }
        if($scope.tags.length > 0 && $scope.tags.length < 5) {
            console.log($scope.count1);
            if($scope.count1 == 0) {

                fd.append('file', file);
                fd.append('question', angular.toJson($scope.questionForm, true));
                fd.append('topic', angular.toJson($scope.tags, true));
                $http({
                    method: "POST",
                    url: name,
                    data: fd,
                    transformRequest: angular.identity,
                    headers: {
                        'Content-Type': undefined
                    }
                });
                $scope.questionForm.title = "";
                $scope.questionForm.content = "";
                $scope.statussubmit = "Thanh Cong !!"
                $scope.tags = "";
            }
            else {
                $scope.message="noi dung tag khong qua 20 ki tu";
            }
        }else{
            $scope.message="ban can nhap it nhat 1 tag va nhieu nhat 5 tag";
        }
        $scope.questionForm.title = "";
        $scope.questionForm.content = "";
        $scope.questionForm.image = "";
        $scope.statussubmit = "Thanh Cong !!"
        $scope.tagForm.name = "";

    };

});

//page listquestionbytopic
Askme.controller("listquestionbytopicController", function ($scope, $http) {
    $scope.questionbytopics = [];
    $scope.getQuestionByTopicData = function(id) {
        urlstr = 'http://localhost:8080/getAllQuestionByidTopic/' + id;
        url =  'http://localhost:8080/getcountanswerAllQuestionByidTopic/'+id;
        url1 = 'http://localhost:8080/mapcountupvotebyquestionfortopic/'+id;
        $http({
            method: 'GET',
            url: urlstr
        }).then(function successCallback(response) {
            $scope.questionbytopics = response.data;
            console.log($scope.questionbytopics);
        }), function errorCallback(response) {
            console.log(response.statusText);
        }
        var countAswerQuestionByTopicData = {
            method: 'GET',
            url: url
        };
        $http(countAswerQuestionByTopicData).success(
            function (data) {
                $scope.countanswerquestionbytopics = data;
            }
        );

        var countVoteUpQuestionByTopicData = {
            method: 'GET',
            url: url
        };
        $http(countVoteUpQuestionByTopicData).success(
            function (data) {
                $scope.countvoteupquestionbytopicdatas = data;
            }
        );

    };

});
//listUser
Askme.controller("listUser", function ($scope, $http) {
    $scope.kiemtra = 0;
    checkdangnhap();
    $scope.users = [];
    $scope.following = ["",[]];

    _refreshUserData();

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

    refreshFollowinhData();
    function refreshFollowinhData() {
        $http({
            method: 'GET',
            url: 'http://localhost:8080/getmapfollowing'
        }).then(function successCallback(response) {
            $scope.following = response.data;
        }), function errorCallback(response) {
            console.log(response.statusText);
        }

    }

    function _refreshUserData() {
        $http({
            method: 'GET',
            url: 'http://localhost:8080/listUser'
        }).then(function successCallback(response) {
            $scope.users = response.data;
        }), function errorCallback(response) {
            console.log(response.statusText);
        }
    }
    $scope.delUser = function (user) {
        if ($scope.kiemtra == 3) {
            var urlstr = 'http://localhost:8080/deluser/' + user.id;
            $http({
                method: 'Delete',
                url: urlstr
            })
            $scope.users.splice($scope.users.indexOf(user), 1);
        }

    }
    $scope.clickfollowing = function (id) {
        if ($scope.kiemtra == 1|| $scope.kiemtra == 3) {

            if($scope.following[id]['following'] == 0){
                var urlstr = 'http://localhost:8080/following/' + id;
                $http({
                    method: 'POST',
                    url: urlstr
                })
                $scope.following[id]['following']++;
            }
            else{
                var urlstr1 = 'http://localhost:8080/destroyfollowing/' + id;
                $http({
                    method: 'Delete',
                    url: urlstr1
                })
                $scope.following[id]['following']--;}


        }else {
            alert("Dang nhap de vote cau hoi va cau tra loi");
        }

    }
});
//ReportController
Askme.controller("ReportController", function ($scope, $http) {
    $scope.formreport = {
        content : ""
    };

    $scope.submitReport = function (id) {
        urlstr = 'http://localhost:8080/addreport/' + id;
        $http({
            method: "POST",
            url: urlstr,
            data: angular.toJson($scope.formreport),
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(function () {
            alert("Thanh Cong !!");
            $scope.content="";
        })

    }

});
//listreports
Askme.controller("listReports", function ($scope, $http) {
    $scope.reports = [];

    _refreshQuestionData();

    function _refreshQuestionData() {
        $http({
            method: 'GET',
            url: 'http://localhost:8080/reports'
        }).then(function successCallback(response) {
            $scope.reports = response.data;
        }), function errorCallback(response) {
            console.log(response.statusText);
        }
    }
});
//login
Askme.controller("LoginController",function () {
});

//profile
Askme.controller("profile",function () {
});

//registration
Askme.controller("RegisterController",function () {
});


//questionByUserController
Askme.controller("questionByUserController",function ($scope,$http) {
    $scope.questions=[];
    $scope.getQuestionByUser =function(id)  {
        urlstr = 'http://localhost:8080/getAllQuestionByUser/' +id;
        $http({
            method: 'GET',
            url: urlstr
        }).then(function successCallback(response) {
            $scope.questions = response.data;
        }), function errorCallback(response) {
            console.log(response.statusText);
        }

    }
});
//search
Askme.controller("searchquestionController",function ($scope,$http) {
    $scope.nginit = function (string) {
        $scope.string = string;

        _getQuestionByUser( $scope.string);
        checkquestion1( $scope.string);
    }

    $scope.questions=[];

    $scope.checkquestion=0;


    function _getQuestionByUser(string) {
        urlstr = 'http://localhost:8080/listsearchQuestion/' + string;
        $http({
            method: 'GET',
            url: urlstr
        }).then(function successCallback(response) {
            $scope.questions = response.data;
        }), function errorCallback(response) {
            console.log(response.statusText);
        }

    }
    function checkquestion1(string) {
        urlstr = 'http://localhost:8080//checksearchQuestion/' + string;
        $http({
            method: 'GET',
            url: urlstr
        }).then(function successCallback(response) {
            $scope.checkquestion = response.data;
        }), function errorCallback(response) {
            console.log(response.statusText);
        }
    };
});
//AnswerController
Askme.controller("AnswerController", function ($scope, $http) {

    $scope.kiemtra = 0;
    checkdangnhap();
    $scope.nginit = function (idquestion) {
        $scope.question.id_question = idquestion;
        refreshAnswerData($scope.question.id_question);
        refreshVoteAnswerData($scope.question.id_question);
    }
    $scope.share = function(){
        // FB.ui(
        //     {
        //         method: 'share',
        //         href: 'https://google.com.vn/'
        //     }, function(response){});
        FB.ui(
            {
                method: 'feed',
                name: 'Đồ Án Hữu Lượng :v',
                link: 'https://google.com.vn',

                caption: $scope.question.title,
                description: 'xxxxx xxxxx',
                message: ''
            });
    }
    $scope.AnswerForm = {
        content: "",
        image: ""
    };
    $scope.AnswereditForm = {
        content: "",
        image: ""
    };

    $scope.answers = [];
    $scope.answer = {
        id: "",
        content: "",
        image: ""
    };
    $scope.VoteAnswer = ["", []];


    function refreshAnswerData(id) {
        urlstr = 'http://localhost:8080/getallanswer/' + id;
        $http({
            method: 'GET',
            url: urlstr
        }).then(function successCallback(response) {
            $scope.answers = response.data;
        }), function errorCallback(response) {
            console.log(response.statusText);
        }

    }


    function refreshVoteAnswerData(id) {
        urlstr = 'http://localhost:8080/getmapvoteanswers/' +id ;
        $http({
            method: 'GET',
            url: urlstr
        }).then(function successCallback(response) {
            $scope.VoteAnswer = response.data;
        }), function errorCallback(response) {
            console.log(response.statusText);
        }

    }


    //17/4
    $scope.clickUp = function () {
        if ($scope.kiemtra == 1 || $scope.kiemtra == 3) {
            if ($scope.voted != 1) {
                urlstr = 'http://localhost:8080/voteupquestion/' + $scope.question.id_question;
                $http({
                    method: 'POST',
                    url: urlstr
                });

                if ($scope.voted == 2) {
                    $scope.upQuestion++;
                    $scope.DownQuestion--;

                } else if ($scope.voted == 0) {
                    $scope.upQuestion++;

                }
                $scope.voted = 1;
            }
        }
        else {
            alert("Dang nhap de vote cau hoi va cau tra loi");
        }

    }
    $scope.clickDown = function () {
        if ($scope.kiemtra == 1 || $scope.kiemtra == 3) {
            if ($scope.voted != 2) {
                urlstr = 'http://localhost:8080/votedownquestion/'+ $scope.question.id_question;
                $http({
                    method: 'POST',
                    url: urlstr
                });
                if ($scope.voted == 1) {
                    $scope.DownQuestion++;
                    $scope.upQuestion--;

                }
                else if ($scope.voted == 0) {
                    $scope.DownQuestion++;

                }
                $scope.voted = 2;
            }
        }
        else {
            alert("Dang nhap de vote cau hoi va cau tra loi");
        }
    }


    $scope.clickUpAnswer = function (id) {
        if ($scope.kiemtra == 1 || $scope.kiemtra == 3) {
            urlstr = 'http://localhost:8080/voteupanswer/' + id;
            $http({
                method: 'POST',
                url: urlstr
            })
            if ($scope.VoteAnswer[id]["voted"] != 1) {
                if ($scope.VoteAnswer[id]["voted"] == 0) {
                    $scope.VoteAnswer[id]["countup"]++;
                    $scope.VoteAnswer[id]["voted"] = 1;

                    // $scope.VoteAnswer[id] = {"countup" :1,"countdown" :0,"voted" :1 };
                }
                else if ($scope.VoteAnswer[id]["voted"] == 2) {
                    $scope.VoteAnswer[id]["countup"]++;
                    $scope.VoteAnswer[id]["countdown"]--;
                    $scope.VoteAnswer[id]["voted"] = 1;
                }
            }
        }
        else {
            alert("Dang nhap de vote cau hoi va cau tra loi");
        }

    }
    $scope.clickDownAnswer = function (id) {
        if ($scope.kiemtra == 1 || $scope.kiemtra == 3) {
            urlstr = 'http://localhost:8080/votedownanswer/' + id;
            $http({
                method: 'POST',
                url: urlstr
            })
            if ($scope.VoteAnswer[id]["voted"] != 2) {
                if ($scope.VoteAnswer[id]["voted"] == 0) {
                    $scope.VoteAnswer[id]["countdown"]++;
                    $scope.VoteAnswer[id]["voted"] = 2;

                    // $scope.VoteAnswer[id] = {"countup" :1,"countdown" :0,"voted" :1 };
                }
                else if ($scope.VoteAnswer[id]["voted"] == 1) {
                    $scope.VoteAnswer[id]["countup"]--;
                    $scope.VoteAnswer[id]["countdown"]++;
                    $scope.VoteAnswer[id]["voted"] = 2;
                }
            }

        }
        else {
            alert("Dang nhap de vote cau hoi va cau tra loi");
        }

    }

    //kiem tra dang nhap
    function checkdangnhap() {
        $http({
            method: 'GET',
            url: 'http://localhost:8080/testthu'
        }).then(function successCallback(response) {
            $scope.kiemtra = response.data;
        }, function errorCallback(response) {
            console.log(response.statusText);
        })

    }

    //25-4 : ham delAnswer() gui yeu cau xoa cau tra loi
    $scope.delAnswer = function () {
        urlstr = 'http://localhost:8080/delanswer/' + $scope.answerx.id;
        $http({
            method: 'DELETE',
            url: urlstr
        })
        $scope.answers.splice($scope.answers.indexOf($scope.answerx), 1);
    }

    //26-4 sua noi dung cau tra loi
    $scope.editAnswer = function () {
        console.log($scope.answerx.id);
        $scope.answerx.content = $scope.AnswereditForm.content;
        $http({
            method: "PUT",
            url: 'http://localhost:8080/editanswer',
            data: angular.toJson($scope.answerx),
            headers: {
                'Content-Type': 'application/json'
            }
        })
    }
    //26-4 load data answer to modal
    $scope.answermodal = function (answer) {
        $scope.answerx = answer;
        $scope.AnswereditForm.content = answer.content;
        $scope.AnswereditForm.image = answer.image;
    }

    //28-4 load data question to modal
    $scope.questionmodal = function () {
        $scope.questionx = {
            title : $scope.question.title,
            content: $scope.question.content
        }
    }
    //28-4 sua noi dung cau hoi
    $scope.editQuestion = function () {
        if (typeof  $scope.questionx.title === "undefined" || typeof  $scope.questionx.content === "undefined")
            console.log("loiminmaxQuestion");
        else {
            $scope.question.title =$scope.questionx.title;
            $scope.question.content=$scope.questionx.content;
            $http({
                method: "PUT",
                url: 'http://localhost:8080/updatequestion',
                data: angular.toJson($scope.question),
                headers: {
                    'Content-Type': 'application/json'
                }
            })
        }
    }

    //28-4 delQuestion
    $scope.delQuestion = function () {
        urlstr = 'http://localhost:8080/delquestion/' + $scope.question.id_question;
        $http({
            method: 'DELETE',
            url: urlstr
        })
    }

    $scope.submitAnswer = function (name, email) {
        if (typeof  $scope.AnswerForm.content === "undefined" )
            console.log("loiminmaxaddanswer");
        else {
            urlstr = 'http://localhost:8080/createAnswer/' + $scope.question.id_question;
            $http({
                method: "POST",
                url: urlstr,
                data: angular.toJson($scope.AnswerForm),
                headers: {
                    'Content-Type': 'application/json'
                }
            })
                .then(function success(response) {
                    $scope.res = response.data;
                    console.log($scope.res.id);
                    $scope.answers.push({
                        id: $scope.res.id,
                        content: $scope.res.content,
                        user: {name: name, email: email},
                        time: $scope.res.time
                    });

                    $scope.VoteAnswer[$scope.res.id] = {"countup": 0, "countdown": 0, "voted": 0};
                    $scope.AnswerForm.content = "";
                    $scope.AnswerForm.image = "";
                })
        }
    };

})
//changePassowrd
Askme.controller("ChangePasswordController", function ($scope, $http) {
    $scope.changePassword="";
    $scope.check=0;
    $scope.newPassword="";
    $scope.renewPassword= "";
    $scope.submitPassword = function () {
        var url ="http://localhost:8080/changepassword/" + $scope.changePassword;
        _getcheck();
        function _getcheck() {
            $http({
                method: 'GET',
                url: url
            }).then(function successCallback(response) {
                $scope.check = response.data;
                if($scope.check == 1){
                    if($scope.newPassword == $scope.renewPassword){
                        $scope.message= "hello";
                        var name = "http://localhost:8080/changepassword/"+$scope.newPassword;
                        $http({
                            method: "POST",
                            url: name,
                        });
                        $scope.message1= "Đổi mật khẩu thành công";
                    }
                    else {
                        $scope.message2= "mật khẩu mới và nhập lại mật khẩu không trùng ";
                    }
                }
                else {
                    $scope.message3 ="mật khẩu cũ không đúng";
                }
            })

        }
    }
});
