angular.module('angularApp').controller('loginCtr', ['$scope', '$http', '$resource', '$location', 'Login', function($scope, $http, $resource, $location, Login){
	$scope.user = {}
	
	$scope.Login = function(isValid){
		if (!isValid) return;

		Login.login_confirm({user: $scope.user}, function(){
			$scope.currentUser.username = $scope.user.username		
			$scope.init();
			$location.path('/welcome');
		}, function(error){
			console.log(error);
			$location.path('/login');
		})
	}
}]);



angular.module('angularApp').controller('createCtr', ['$scope', '$http', '$resource', '$location', 'Create', function($scope, $http, $resource, $location, Create){       	
        $scope.user = {};

	$scope.matchPassword = function(){
		if($scope.user.password != $scope.user.password_confirm)
			return true;
		else
			return false;
	}

	$scope.saveData = function(isValid){
            if(!isValid) return;
            
	    Create.create({user: $scope.user}, function(){
		$scope.currentUser.username = $scope.user.username		
		$scope.init();
		$location.path('/welcome');		
	    }, function(error){
  		console.log(error)
	    })	
             
        }
}]);
