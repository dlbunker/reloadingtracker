angular.module('app.services', []).factory('Load', function($resource) {
  return $resource('/api/v1/loads/:id', { id: '@id' }, {
    update: {
      method: 'PUT'
    }
  });
}).service('popupService',function($window){
    this.showPopup=function(message){
        return $window.confirm(message);
    }
});
