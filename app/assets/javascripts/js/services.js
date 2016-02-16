angular.module('app.services', []).factory('Load', function ($resource) {
      return $resource('/api/v1/loads/:id', {id: '@id'}, {
        update: {
          method: 'PUT'
        }
      });
    })
    .service('popupService', function ($window) {
      this.showPopup = function (message) {
        return $window.confirm(message);
      }
    });

angular.module('app.services').factory('Caliber', function ($resource) {
  return $resource('/api/v1/calibers/:id', {id: '@id'}, {
    update: {
      method: 'PUT'
    }
  });
});

angular.module('app.services').factory('Trait', function ($resource) {
  return $resource('/api/v1/traits/:id', {id: '@id'}, {
    update: {
      method: 'PUT'
    },
    options: {
      url: '/api/v1/traits/options',
      method: 'GET'
    },
    primers: {
      url: '/api/v1/traits/primers',
      method: 'GET'
    },
    bullets: {
      url: '/api/v1/traits/bullets',
      method: 'GET'
    },
    powders: {
      url: '/api/v1/traits/powders',
      method: 'GET'
    }
  });
});

angular.module('app.services').factory('Supply', function ($resource) {
  return $resource('/api/v1/supplies/:id', {id: '@id'}, {
    update: {
      method: 'PUT'
    },
    adjust: {
      url: '/api/v1/supplies/:id/adjust',
      method: 'PUT'
    },
    products: {
      url: '/api/v1/supplies/products',
      method: 'GET'
    },
    trans_types: {
      url: '/api/v1/supplies/trans_types',
      method: 'GET'
    }
  });
});