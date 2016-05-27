var myApp = angular.module('angularApp', ['ngRoute', 'ngResource']); 

//Factory
myApp.factory('Login', ['$resource',function($resource){
  return $resource('/user/login.json', {},{
    login: { method: 'GET' },
    login_confirm: { method: 'POST' }
  })
}]).factory('Create', ['$resource',function($resource){
  return $resource('/user/register.json', {},{
    create: { method: 'POST' }
  })
}]).factory('Logout', ['$resource',function($resource){
  return $resource('/user/logout.json', {},{
    logout: { method: 'GET' }
  })
}]).factory('Apply', ['$resource', function($resource){
  return $resource('/apply/create.json', {}, {
    create: {method: 'GET'}	
  })
}]);

myApp.controller('totalController', ['$scope', '$location',function($scope,$location){
    $scope.apply = {}
    $scope.user = {}
    //$scope.accurate_true = false	
    $scope.date_data = {}
	$scope.currentUser = {}
	$scope.logStatus = "Log-On"	
	$scope.currentLogin =  "#/login"
	$scope.navbar_url = ""
        $scope.init = function(){
	if(!$scope.currentUser.username){
		$scope.logStatus = "Log-On"
		$scope.currentLogin =  "#/login"}
	else{
		$scope.logStatus = "Log-Out"
		$scope.currentLogin =  "#/logout"
	}
	$scope.navbar_url = "/templates/navbar.html"
	  $location.path('/welcome');	
	}
	$scope.init();
}]);

myApp.controller('logoutCtr', ['$scope', 'Logout','$location', function($scope, Logout, $location){
  $location.path('/welcome');	
  $scope.currentUser = {}	
  Logout.logout();
  $scope.init(); 	
}]);

myApp.config([
  '$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
    $routeProvider.when('/login',{
      templateUrl: '/templates/users/login.html',
      controller: 'loginCtr'
    });
    $routeProvider.when('/welcome',{
      templateUrl: '/templates/welcome/index.html',
      controller: 'totalController'
    });
    $routeProvider.when('/why_lnb',{
      templateUrl: '/templates/welcome/why_lnb.html',
      controller: 'welcomeIndexCtr'
    });
    $routeProvider.when('/how_lnb',{
      templateUrl: '/templates/welcome/how_lnb.html',
      controller: 'welcomeIndexCtr'
    });
    $routeProvider.when('/about_lnb',{
      templateUrl: '/templates/welcome/about_lnb.html',
      controller: 'welcomeIndexCtr'
    });
    $routeProvider.when('/apply',{
      templateUrl: '/templates/apply/create.html',
      controller: 'applyController'
    });
    $routeProvider.when('/login',{
      templateUrl: '/templates/users/login.html',
      controller: 'loginCtr'
    });    
    $routeProvider.when('/create',{
      templateUrl: '/templates/users/create.html',
      controller: 'createCtr'
    });
    $routeProvider.when('/logout',{
      templateUrl: '/welcome',
      controller: 'logoutCtr'
    });
    $routeProvider.when('/result_page_1',{
        templateUrl: '/templates/apply/result_page_1.html',
        controller: 'applyController'
    });
    $routeProvider.when('/result_page_2',{
        templateUrl: '/templates/apply/result_page_2.html',
        controller: 'applyController'
    });
    $routeProvider.when('/forgot', {
        templateUrl: '/templates/users/forgot.html',
        controller: 'forgotController'
    })
    $routeProvider.otherwise({
      redirectTo: '/welcome'
    });
    $routeProvider.when('/terms', {
	templateUrl: '/templates/apply/termsandconditions.html',
	controller: 'applyController'
    })
  }
]);
