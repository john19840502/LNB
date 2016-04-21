/**
 * Created by root on 4/21/16.
 */
angular.module('angularApp').controller('applyController', ['$scope', '$resource', '$location', 'Apply', function($scope, $resource, $location, Apply,$rootscope){

    $scope.message =""
    $scope.message_show = false

    $scope.message_result_1_less = "Congratulations.You have been approved to borrow your requested amount of $" + $scope.apply.borrowing_amount + " at " + ($scope.apply.advance_APR - 5) + "% APR, which is 5% lower than at the rate you can borrow from your credit card company.Moreover, your total approved borrowing amount from us is $"+ $scope.total_limit+" so you can borrow more if you would like to. Here is what we can offer.Any amount upto $"+$scope.apply.advance_limit+", we can lend it to you at "+ ($scope.apply.advance_APR - 5)+"% APR. For any amount between $"+$scope.apply.advance_limit+" and $"+$scope.apply.total_limit+", we can lend it to you at "+($scope.apply.advance_APR + 5)+"% APR."
    $scope.message_result_1_higher = "Congratulations. You have been approved to borrow your requested amount of $" + $scope.apply.borrowing_amount + "at "+ ($scope.apply.advance_APR + 5) +"% APR, which is 5% higher because we are taking more risk as you borrow more but please give us some credit that we are providing you more capital which something your credit card is hesitant to do. Moreover, your total approved borrowing amount from us is $"+$scope.apply.total_limit+" so you can borrow more if you would like to but depending on your situation, we may provide different maximum amount you are approved to borrow from us when you submit another application in the future. (This would be the normal response with the "+($scope.apply.advance_APR + 5)+"% APR but since the customer lives in New York, the premium interst rate (APR) is "+($scope.apply.advance_APR - 5)+"%). "

    $scope.show_message_result = function(){
        if($scope.apply.borrowing_amount <= $scope.apply.advance_limit){
            return $scope.message_result_1_less;
        }else{
            return $scope.message_result_1_higher;
        }
    }

    $scope.result_next_page = function(){
        $scope.apply.card_exp_date = $scope.date_data.year+"-"+$scope.date_data.month+"-"+$scope.date_data.day;

        Apply.create({apply_data: $scope.apply, quick_or_cheap: $scope.quick_or_cheap, regular_or_discount: $scope.regular_or_discount}, function(data){
            $location.path('/create');
        }, function(error){
            console.log(error)
        })
    }

    $scope.saveDataCreditCard = function(isValid){
        if(!isValid){
            $scope.message_show = false;
            return false;
        }
        if($scope.apply.borrowing_amount >= $scope.apply.total_limit)
        {
            $scope.message="Borrowing Amount cannot be higher than Available Limit"
            $scope.message_show = true;
            return false;
        }
        if($scope.apply.days_to_borrow < 7)
        {
            $scope.message="Borrowing days cannot be less than 7"
            $scope.message_show = true;

            return false;
        }

        $location.path('/result_page_1');
    }

    $scope.available_limit = function(){
        $scope.apply.total_limit = $scope.apply.card_limit - $scope.apply.outstanding_balance
    }
}]);

angular.module('angularApp').directive('dateFormat', function() {
    return {
        restrict: 'A',
        link: function(scope, el, at) {
            var format = at.dateFormat;
            scope.$watch(at.ngModel, function(date) {
                var result = moment(date).format(format);
                el.val(result);
            });
        }
    };
});