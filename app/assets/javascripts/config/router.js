var app = angular.module("app", ['ui.router', 'oxymoron', 'angularUtils.directives.dirPagination']);

app.config(['$stateProvider', function ($stateProvider) {
  $stateProvider.rails()
}])