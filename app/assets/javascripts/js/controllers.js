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
      $scope.primers = Trait.primers();
      $scope.bullets = Trait.bullets();
      $scope.powders = Trait.powders();

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
        $scope.primers = Trait.primers();
        $scope.bullets = Trait.bullets();
        $scope.powders = Trait.powders();
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
      $scope.trait_options = Trait.type_options();

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
        $scope.trait_options = Trait.type_options();
      };

      $scope.loadTrait();
    })
    .controller('SupplyListController', function ($scope, $state, popupService, $window, Supply) {
      $scope.supplies = Supply.query();

      $scope.deleteSupply = function (supply) {
        if (popupService.showPopup('Really delete this?')) {
          supply.$delete(function () {
            $scope.supplies = Supply.query();
          });
        }
      };
    })
    .controller('SupplyViewController', function ($scope, $stateParams, Supply) {
      $scope.supply = Supply.get({id: $stateParams.id});
    })
    .controller('SupplyCreateController', function ($scope, $state, $stateParams, Supply) {
      $scope.supply = new Supply();
      $scope.products = Supply.products();

      $scope.addSupply = function () {
        $scope.supply.$save(function () {
          $state.go('supplies');
        });
      };
    })
    .controller('SupplyEditController', function ($scope, $state, $stateParams, Supply) {
      $scope.updateSupply = function () {
        $scope.supply.$update(function () {
          $state.go('supplies');
        });
      };

      $scope.loadSupply = function () {
        $scope.supply = Supply.get({id: $stateParams.id});
        $scope.products = Supply.products();
      };

      $scope.loadSupply();
    })
    .controller('SupplyOnhandController', function ($scope, $state, $stateParams, Supply) {
      $scope.adjustSupply = function () {
        $scope.supply.$adjust(function () {
          $state.go('supplies');
        });
      };

      $scope.loadSupply = function () {
        $scope.supply = Supply.get({id: $stateParams.id});
        $scope.trans_types = Supply.trans_types();
      };

      $scope.loadSupply();
    });