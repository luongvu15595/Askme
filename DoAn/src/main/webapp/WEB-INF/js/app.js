var Askme = angular.module("Askme", ['ngTagsInput','angularUtils.directives.dirPagination']);
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
        var str = $scope.headerForm.search;
        str = str.toLowerCase();
        str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
        str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
        str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
        str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
        str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
        str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
        str = str.replace(/đ/g, "d");
        var name = "/search/" + str;
        location.href = name;
    };


});
//page listOfQuestion
Askme.controller("QuestionController", function ($scope, $http) {
    $scope.questions = [];
    $scope.questionsHotWeeks=[];
    $scope.questionsHotMonths=[];
    $scope.topichots =[];
    _refreshQuestionData();
    _refreshQuestionHotWeekData();
    _refreshtopichotData();
    $scope.kiemtra = 0;

    checkdangnhap();
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

    function _refreshtopichotData(){
        $http({
            method: 'GET',
            url: 'http://localhost:8080/listtopichot'
        }).then(function successCallback(response) {
            $scope.topichots = response.data;
        })
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
    function _refreshQuestionData() {
        $http({
            method: 'GET',
            url: 'http://localhost:8080/getAllQuestion'
        }).then(function successCallback(response) {
            $scope.questions = response.data;
            $scope.loadMore = function() {
                var last = $scope.questions[$scope.questions.length - 1];
                for(var i = 1; i <= 2; i++) {
                    $scope.questions.push(last + i);
                }
            };

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
    $scope.topichots =[];
    _refreshtopichotData();
    function _refreshtopichotData(){
        $http({
            method: 'GET',
            url: 'http://localhost:8080/listtopichot'
        }).then(function successCallback(response) {
            $scope.topichots = response.data;
        })
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
    $scope.kiemtra = 0;
    $scope.topics = [];
    $scope.topic1 = {
       name:""
    };
    checkdangnhap();
    _refreshTopicData();
    $scope.updateTopicModal = {
        name: "",
    };
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
    var countquestionbytopic = {
        method: 'GET',
        url: 'http://localhost:8080/countquestionbytopic'
    };
    $http(countquestionbytopic).success(
        function (data) {
            $scope.countquestionbytopics = data;
        }
    );

    $scope.delTopicModal = function (topic) {
        $scope.topic = topic;
        $scope.delTopic= function () {
            var urlstr = 'http://localhost:8080/deletetopic/' + topic.id;
            $http({
                method: 'Delete',
                url: urlstr
            })
            $scope.topics.splice($scope.topics.indexOf(topic), 1);
        }
    }
    $scope.updateTopicModal = function (topic) {
        $scope.topicx = topic;
        $scope.topic1.name = topic.name;
    }
    $scope.updateTopic = function () {
        console.log($scope.topicx.id);
        $scope.topicx.name = $scope.topic1.name;
    }

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
        var name1 = "/createQuestion1";
        var fd = new FormData;
        console.log($scope.tags.length + "hello");

        for(var i =0; i<$scope.tags.length;i++){
            if ($scope.tags[i].name.length > 10){
                $scope.count1 = 1;
                break;
            }
            else {$scope.count1 = 0;}
        }
        if($scope.tags.length > 0 && $scope.tags.length < 5) {
            console.log($scope.count1);
            if($scope.count1 == 0) {
                if (typeof  file === "undefined")
                {
                    fd.append('question', angular.toJson($scope.questionForm, true));
                    fd.append('topic', angular.toJson($scope.tags, true));
                    $http({
                        method: "POST",
                        url: name1,
                        data: fd,
                        transformRequest: angular.identity,
                        headers: {
                            'Content-Type': undefined
                        }
                    });
                    $scope.message="";
                    $scope.questionForm.title = "";
                    $scope.questionForm.content = "";
                    $scope.statussubmit = "đăng bài thành công quay về trang chủ để xem kết quả !! !!"
                    $scope.tags = "";
                }
                else {
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
                    $scope.statussubmit = "đăng bài thành công quay về trang chủ để xem kết quả !!"
                    $scope.tags = "";

                }}
            else {
                $scope.message="";
                $scope.message="Nội dung của 1 tag không quá 10 kí tự";
            }
        }else{
            $scope.message="";
            $scope.message="Bạn cần ít nhất 1 tag và nhiều nhất 5 tags";
        }


    };

});

//page listquestionbytopic
Askme.controller("listquestionbytopicController", function ($scope, $http) {
    $scope.kiemtra = 0;
    checkdangnhap();
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
    $scope.topichots =[];
    _refreshtopichotData();
    function _refreshtopichotData(){
        $http({
            method: 'GET',
            url: 'http://localhost:8080/listtopichot'
        }).then(function successCallback(response) {
            $scope.topichots = response.data;
        })
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
    $scope.questionbytopics = [];
    $scope.getQuestionByTopicData = function(id) {
        urlstr = 'http://localhost:8080/getAllQuestionByidTopic/' + id;
        url =  'http://localhost:8080/getcountanswerAllQuestionByidTopic/'+id;
        url1 = 'http://localhost:8080/mapcountupvotebyquestionfortopic/'+id;
        url2= 'http://localhost:8080/gettopicbytopic/'+id;
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

        var topicByTopicData = {
            method: 'GET',
            url: url2
        };
        $http(topicByTopicData).success(
            function (data) {
                $scope.topics2 = data;
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
    $scope.topichots =[];
    _refreshtopichotData();
    function _refreshtopichotData(){
        $http({
            method: 'GET',
            url: 'http://localhost:8080/listtopichot'
        }).then(function successCallback(response) {
            $scope.topichots = response.data;
        })
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
    $scope.kiemtra = 0;
    checkdangnhap();
    $scope.users = [];
    $scope.following = ["",[]];
    _refreshcountFollowerData()
    _refreshUserData();
    _refreshcountQuestionData();
    _refreshcountAnswerData();

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

    function _refreshcountFollowerData() {
        $http({
            method: 'GET',
            url: 'http://localhost:8080/countfollower'
        }).then(function successCallback(response) {
            $scope.followers = response.data;
        }), function errorCallback(response) {
            console.log(response.statusText);
        }
    }

    function _refreshcountAnswerData() {
        $http({
            method: 'GET',
            url: 'http://localhost:8080/listsortanswerbyuser'
        }).then(function successCallback(response) {
            $scope.countanswers = response.data;
        }), function errorCallback(response) {
            console.log(response.statusText);
        }
    }

    function _refreshcountQuestionData() {
        $http({
            method: 'GET',
            url: 'http://localhost:8080/listsortquestionbyuser'
        }).then(function successCallback(response) {
            $scope.countquestions = response.data;
        }), function errorCallback(response) {
            console.log(response.statusText);
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
//managerUser
Askme.controller("managerUser", function ($scope, $http) {
    $scope.users = [];

    _refreshUserData();
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

    $scope.delUserModal = function (user) {
        $scope.user = user;
        $scope.delUser= function () {
            var urlstr = 'http://localhost:8080/deluser/' + user.id;
            $http({
                method: 'Delete',
                url: urlstr
            })
            $scope.users.splice($scope.users.indexOf(user), 1);
        }



    }
});

//ReportController
Askme.controller("ReportController", function ($scope, $http) {
    $scope.formreport = {
        content : ""
    };

    $scope.submitReport = function (id) {
        if ($scope.selected != '1' && $scope.selected != '0' ) $scope.formreport.content = $scope.selected;
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
            $scope.formreport.content="";
        })


    }

});
//listreports
Askme.controller("listReports", function ($scope, $http) {
    $scope.reports = [];
    $scope.checkcancel=0;
    _refreshQuestionData();
    _refreshmapstatusData();
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

    function _refreshmapstatusData() {
        $http({
            method: 'GET',
            url: 'http://localhost:8080/mapstatus'
        }).then(function successCallback(response) {
            $scope.statusreports = response.data;
            $scope.cancel= function (id) {
                urlstr = 'http://localhost:8080/updatestatus/' + id;
                $http({
                    method: 'POST',
                    url: urlstr
                })

                $scope.statusreports[id] =1;

            }
        }), function errorCallback(response) {
            console.log(response.statusText);
        }
    }


});
//login
Askme.controller("LoginController",function () {
});

//profile
Askme.controller("profile",function ($scope,$http) {
    $scope.userModal = function () {
        $scope.userx = {
            id : $scope.user.id,
            name : $scope.user.name,
            email : $scope.user.email,
            image : ''
        }
    }
    $scope.editUser = function () {
        $http({
            method: "PUT",
            url: 'http://localhost:8080/edituser',
            data: angular.toJson($scope.userx),
            headers: {
                'Content-Type': 'application/json'
            }
        });
        $scope.user.name = $scope.userx.name;
    }
    $scope.topichots =[];
    _refreshtopichotData();
    function _refreshtopichotData(){
        $http({
            method: 'GET',
            url: 'http://localhost:8080/listtopichot'
        }).then(function successCallback(response) {
            $scope.topichots = response.data;
        })
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
    $scope.questions=[];
    $scope.getquestionbyuser = function (id) {
        $scope.id = id;
        _getQuestionByUser( $scope.id);
        _countanswerquestionbyuser( $scope.id);
        _countupvotequestionbyuser( $scope.id);
        _listtopicbyuser($scope.id);

    }
    function _getQuestionByUser(id) {
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

    function _countupvotequestionbyuser(id) {
        urlstr = 'http://localhost:8080/countupvotetopicquestionbyuser/' +id;
        $http({
            method: 'GET',
            url: urlstr
        }).then(function successCallback(response) {
            $scope.upvotes = response.data;
        }), function errorCallback(response) {
            console.log(response.statusText);
        }

    }
    function _countanswerquestionbyuser(id) {
        urlstr = 'http://localhost:8080/countanswerquestionbyuser/' +id;
        $http({
            method: 'GET',
            url: urlstr
        }).then(function successCallback(response) {
            $scope.answers = response.data;
            console.log($scope.answers);
        }), function errorCallback(response) {
            console.log(response.statusText);
        }

    }

    function _listtopicbyuser(id) {
        urlstr = 'http://localhost:8080/getlisttopicquestionbyuser/' +id;
        $http({
            method: 'GET',
            url: urlstr
        }).then(function successCallback(response) {
            $scope.topics = response.data;
        }), function errorCallback(response) {
            console.log(response.statusText);
        }

    }
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
    $scope.kiemtra = 0;
    checkdangnhap();
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
    $scope.topichots =[];
    _refreshtopichotData();
    function _refreshtopichotData(){
        $http({
            method: 'GET',
            url: 'http://localhost:8080/listtopichot'
        }).then(function successCallback(response) {
            $scope.topichots = response.data;
        })
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
    $scope.nginit = function (string) {
        $scope.string = string;

        _getQuestionByUser( $scope.string);
        checkquestion1( $scope.string);
        _countanswer($scope.string);
        _listtopic($scope.string);
        _countUpvote($scope.string);
    }

    $scope.questions=[];

    $scope.checkquestion=0;

    function _countanswer(string) {

        urlstr = 'http://localhost:8080/countanswerquestionsearch/' + string;
        $http({
            method: 'GET',
            url: urlstr
        }).then(function successCallback(response) {
            $scope.answers1 = response.data;
        }), function errorCallback(response) {
            console.log(response.statusText);
        }

    }

    function _listtopic(string) {

        urlstr = 'http://localhost:8080/topicquestionsearch/' + string;
        $http({
            method: 'GET',
            url: urlstr
        }).then(function successCallback(response) {
            $scope.topics1 = response.data;
        }), function errorCallback(response) {
            console.log(response.statusText);
        }

    }
    function _countUpvote(string) {

        urlstr = 'http://localhost:8080/countupvotequestionsearch/' + string;
        $http({
            method: 'GET',
            url: urlstr
        }).then(function successCallback(response) {
            $scope.upvotes1 = response.data;
        }), function errorCallback(response) {
            console.log(response.statusText);
        }

    }

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
    $scope.topichots =[];
    _refreshtopichotData();
    function _refreshtopichotData(){
        $http({
            method: 'GET',
            url: 'http://localhost:8080/listtopichot'
        }).then(function successCallback(response) {
            $scope.topichots = response.data;
        })
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
    $scope.kiemtra = 0;
    checkdangnhap();
    $scope.topics =[];

    $scope.nginit = function (idquestion,image) {
        if (image.length == 0 ) $scope.isImage = 0;
        else $scope.isImage =1;
        $scope.question.id_question = idquestion;
        refreshAnswerData($scope.question.id_question);
        refreshVoteAnswerData($scope.question.id_question);
        _refreshtopicData($scope.question.id_question);
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
        image:""
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

    function  _refreshtopicData(id) {
        urlstr = 'http://localhost:8080/getAllTopicByQuestion/' + id;
        $http({
            method: 'GET',
            url: urlstr
        }).then(function successCallback(response) {
            $scope.topics = response.data;
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
                data: {id_question : $scope.question.id_question , content : $scope.question.content , title : $scope.question.title},
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

    $scope.submitAnswer = function (id,name, email) {
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
                        user: {id: id,name: name, email: email},
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

Askme.controller('rightController',function ($scope, $http){
    $scope.questionsHotMonths=[];
    $scope.usermanyquestions=[];
    $scope.usermanyanswers=[];

    _refreshQuestionHotMonthData();
    _refreshUsermanyquestionData();
    _refreshUsermanyanswerData();

    var countListQuestion = {
        method: 'GET',
        url: 'http://localhost:8080/countlistquestion'
    };
    $http(countListQuestion).success(
        function (data) {
            $scope.countlistquestion = data;
        }
    );

    var countListUser = {
        method: 'GET',
        url: 'http://localhost:8080/countlistuser'
    };
    $http(countListUser).success(
        function (data) {
            $scope.countlistuser = data;
        }
    );

    var listcountquestionbyuser = {
        method: 'GET',
        url: 'http://localhost:8080/listsortquestionbyuser'
    };
    $http(listcountquestionbyuser).success(
        function (data) {
            $scope.listcountquestionbyusers = data;
        }
    );



    function _refreshQuestionHotMonthData() {
        $http({
            method: 'GET',
            url: 'http://localhost:8080/listquestionhotmonth'
        }).then(function successCallback(response) {
            $scope.questionsHotMonths = response.data;
        })
    };
    function _refreshUsermanyquestionData(){
        $http({
            method: 'GET',
            url: 'http://localhost:8080/listsortuserbyquestion'
        }).then(function successCallback(response) {
            $scope.usermanyquestions = response.data;
        })
    };

    function _refreshUsermanyanswerData(){
        $http({
            method: 'GET',
            url: 'http://localhost:8080/listsortuserbyanswer'
        }).then(function successCallback(response) {
            $scope.usermanyanswers = response.data;
        })
    };



    var listcountanswerbyuser = {
        method: 'GET',
        url: 'http://localhost:8080/listsortanswerbyuser'
    };
    $http(listcountanswerbyuser).success(
        function (data) {
            $scope.listcountanswerbyusers = data;
        }
    );


})
