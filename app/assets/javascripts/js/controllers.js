angular.module('app.controllers', [])
    .controller('LoadListController', function ($scope, $state, popupService, $window, Load) {
      $scope.loads = Load.query();

      $scope.deleteLoad = function (load) {
        if (popupService.showPopup('Really delete this?')) {
          load.$delete(function () {
            $scope.loads = Load.query();
          });
        }
      };
    })
    .controller('LoadViewController', function ($scope, $stateParams, Load) {
      $scope.load = Load.get({id: $stateParams.id});
    })
    .controller('LoadCreateController', function ($scope, $state, $stateParams, Load, Caliber, Trait) {
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
    })
    .controller('LoadEditController', function ($scope, $state, $stateParams, Load, Caliber, Trait) {
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
    })
    .controller('TraitListController', function ($scope, $state, popupService, $window, Trait) {
      $scope.traits = Trait.query();

      $scope.deleteTrait = function (trait) {
        if (popupService.showPopup('Change the status?')) {
          trait.$delete(function () {
            $scope.traits = Trait.query();
          });
        }
      };
    })
    .controller('TraitViewController', function ($scope, $stateParams, Trait) {
      $scope.trait = Trait.get({id: $stateParams.id});
    })
    .controller('TraitCreateController', function ($scope, $state, $stateParams, Trait) {
      $scope.trait = new Trait();
      $scope.type_options = Trait.query({options: true});

      $scope.addTrait = function () {
        $scope.trait.$save(function () {
          $state.go('traits');
        });
      };
    })
    .controller('TraitEditController', function ($scope, $state, $stateParams, Trait) {
      $scope.updateTrait = function () {
        $scope.trait.$update(function () {
          $state.go('traits');
        });
      };

      $scope.loadTrait = function () {
        $scope.trait = Trait.get({id: $stateParams.id});
        $scope.type_options = Trait.query({options: true});
      };

      $scope.loadTrait();
    });