// Generated by CoffeeScript 1.7.1
(function() {
  'use strict';
  angular.module('niblApp').controller('pomoTimerCtrl', function($scope, timer, $modalInstance) {
    $scope.timer = timer;
    return $modalInstance.result.then(function() {
      return console.log('success');
    }, function() {
      return timer.fullReset();
    });
  });

}).call(this);
