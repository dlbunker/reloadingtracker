angular.module('navController', [])
    .controller('nav', function ($scope, $state, $rootScope) {
      $scope.title = 'Reloading Tracker';

      // returns true if the current router url matches the passed in url
      // so views can set 'active' on links easily
      $scope.isUrl = function (url) {
        if (url === '#') return false;
        return ('#' + $state.$current.url.source + '/').indexOf(url + '/') === 0;
      };

      $scope.pages = [
        {name: 'My Loads', url: '#/loads', admin: false},
        {name: 'My Supplies', url: '#/supplies', admin: false},
        {name: 'Traits', url: '#/traits', admin: true}
      ];
    });
