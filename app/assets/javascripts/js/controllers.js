angular.module('app.controllers', []).controller('LoadListController', function ($scope, $state, popupService, $window, Load) {
  $scope.loads = Load.query();

  $scope.deleteLoad = function (load) {
    if (popupService.showPopup('Really delete this?')) {
      load.$delete(function () {
        $scope.loads = Load.query()[0].loads;
      });
    }
  };
}).controller('LoadViewController', function ($scope, $stateParams, Load) {
  $scope.load = Load.get({id: $stateParams.id});
}).controller('LoadCreateController', function ($scope, $state, $stateParams, Load, Caliber, Trait) {
  $scope.load = new Load();

  $scope.calibers = Caliber.query();
  $scope.primers = Trait.query({type: 'primer'});
  $scope.bullets = Trait.query({type: 'bullet'});
  $scope.powders = Trait.query({type: 'powder'});

  $scope.addLoad = function () {
    $scope.load.$save(function () {
      $state.go('loads');
    });
  };
}).controller('LoadEditController', function ($scope, $state, $stateParams, Load, Caliber, Trait) {
  $scope.updateLoad = function () {
    $scope.load.$update(function () {
      $state.go('loads');
    });
  };

  $scope.loadLoad = function () {
    $scope.load = Load.get({id: $stateParams.id});

    $scope.calibers = Caliber.query();
    $scope.primers = Trait.query({type: 'primer'});
    $scope.bullets = Trait.query({type: 'bullet'});
    $scope.powders = Trait.query({type: 'powder'});
  };

  $scope.loadLoad();
});