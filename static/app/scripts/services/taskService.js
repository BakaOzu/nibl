// Generated by CoffeeScript 1.7.1
(function() {
  'use strict';
  angular.module('niblApp').factory('taskService', function(Restangular) {
    Restangular.extendModel('tasks', function(model) {
      console.log(model);
      model.addPomodoro = function() {
        model.pomodoro_completed += 1;
        return model.patch();
      };
      return model;
    });
    return Restangular.all('tasks');
  });

}).call(this);
