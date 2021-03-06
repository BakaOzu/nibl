// Generated by CoffeeScript 1.7.1
(function() {
  'user strict';
  angular.module('niblApp').directive('pomodoroCount', function() {
    return {
      restrict: 'A',
      link: function(scope, element) {
        var completedPomodoro, i, pomodoroBlock, _i, _ref;
        pomodoroBlock = '';
        completedPomodoro = '<span style="color:red" class="glyphicon glyphicon-expand"></span>';
        for (i = _i = 0, _ref = scope.task.pomodoro; _i <= _ref; i = _i += 1) {
          pomodoroBlock += completedPomodoro;
        }
        return element.append(pomodoroBlock);
      }
    };
  });

}).call(this);
