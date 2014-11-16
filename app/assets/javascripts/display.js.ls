# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use LiveScript in this file: http://gkz.github.com/LiveScript

app = angular.module('main', ['ngTable', 'ngTableExport', 'ngResource', 'angularSpinner']).controller 'display', ["$scope", "$filter", "$resource", "$http",
  "ngTableParams", "usSpinnerService", ($scope, $filter, $resource, $http, ngTableParams, usSpinnerService) !->
    Api = $resource \/lists.json
    $scope.tableParams = new ngTableParams do
      * page: 1
        count: 10
        sorting:
          Id: 'asc'
      * total: 0
        getData: ($defer, params) !->
          $http.get(\/lists.json).success (data) !->
            params.total data.total
            data.result.values = if params.sorting!
              then $filter('orderBy')(data.result.values, params.orderBy!)
              else data.result.values
            data.result.values = data.result.values.slice((params.page() - 1) * params.count(), params.page() * params.count())
            $defer.resolve data.result
            usSpinnerService.stop \spinner-1
]

