(function() {
	var app = angular.module('app',
		['ui.router',
		 'navController',
		 'ngCookies',
		 'ui.bootstrap',
		 'ngResource',
		 'ng-token-auth',
		 'mgcrea.ngStrap',
		 'app.controllers',
		 'app.services'])

	// define for requirejs loaded modules
	define('app', [], function() { return app; });

	// function for dynamic load with requirejs of a javascript module for use with a view
	// in the state definition call add property `resolve: req('/views/ui.js')`
	// or `resolve: req(['/views/ui.js'])`
	// or `resolve: req('views/ui')`
	function req(deps) {
		if (typeof deps === 'string') deps = [deps];
		return {
			deps: function ($q, $rootScope) {
				var deferred = $q.defer();
				require(deps, function() {
					$rootScope.$apply(function () {
						deferred.resolve();
					});
					deferred.resolve();
				});
				return deferred.promise;
			}
		}
	}

	app.config(function($stateProvider, $urlRouterProvider, $controllerProvider, $authProvider){
		var origController = app.controller
		app.controller = function (name, constructor){
			$controllerProvider.register(name, constructor);
			return origController.apply(this, arguments);
		}

		$authProvider.configure([{
      default:{
        apiUrl: '/api/v1',
        authProviderPaths:{
          linkedin: '/auth/linkedin',
          facebook: '/auth/facebook',
          google: '/auth/google',
          twitter: '/auth/twitter'
				}
			}
    }]);

		var viewsPrefix = 'views/';

		// For any unmatched url, send to /
		$urlRouterProvider.otherwise("/")

		$stateProvider
			// you can set this to no template if you just want to use the html in the page
			.state('home', {
				url: "/",
				templateUrl: viewsPrefix + "home.html",
				data: {
					pageTitle: 'Home'
				}
			})
			.state('loads',{
	        url:'/loads',
	        templateUrl: viewsPrefix + 'loads.html',
	        controller:'LoadListController'
	    }).state('viewLoad',{
	       url:'/loads/:id/view',
	       templateUrl: viewsPrefix + 'load-view.html',
	       controller:'LoadViewController'
	    }).state('newLoad',{
	        url:'/loads/new',
	        templateUrl: viewsPrefix + 'load-add.html',
	        controller:'LoadCreateController'
	    }).state('editLoad',{
	        url:'/loads/:id/edit',
	        templateUrl: viewsPrefix + 'load-edit.html',
	        controller:'LoadEditController'
	    })
			.state('sign_in',{
	      url: '/sign_in',
	      templateUrl: viewsPrefix + 'user_sessions/new.html',
	      controller: 'UserSessionsCtrl',
	      data: {
	        permissions: {
	          only: ['anonymous'],
	          redirectTo: 'home'
	        }
	      }
			})
	    .state('sign_up',{
	      url: '/sign_up',
	      templateUrl: viewsPrefix + 'user_registrations/new.html',
	      controller: 'UserRegistrationsCtrl',
	      data: {
	        permissions: {
	          only: ['anonymous'],
	          redirectTo: 'home'
	        }
	      }
			})
	    .state('reset_password',{
	      url: '/reset_password',
	      templateUrl: viewsPrefix + 'user_registrations/reset.html',
	      controller: 'UserRegistrationsCtrl'
			})
	})
	.directive('updateTitle', ['$rootScope', '$timeout',
		function($rootScope, $timeout) {
			return {
				link: function(scope, element) {
					var listener = function(event, toState) {
						var title = 'Project Name';
						if (toState.data && toState.data.pageTitle) title = toState.data.pageTitle + ' - ' + title;
						$timeout(function() {
							element.text(title);
						}, 0, false);
					};

					$rootScope.$on('$stateChangeSuccess', listener);
				}
			};
		}
	]);

	app.run([
	  '$rootScope', '$modal', '$state', function($rootScope, $modal, $state) {
	    var passwordChangeErrorModal, passwordChangeErrorScope, passwordChangeModal, passwordChangeSuccessModal;
	    $rootScope.$on('auth:registration-email-success', function(ev, data) {
	      var field, ref, results, val;
	      $modal({
	        title: "Success",
	        html: true,
	        content: "<div id='alert-registration-email-sent'>A registration email was " + "sent to " + data.email + ". follow the instructions contained in the " + "email to complete registration.</div>"
	      });
	      ref = $rootScope.registrationForm;
	      results = [];
	      for (field in ref) {
	        val = ref[field];
	        results.push(delete $rootScope.registrationForm[field]);
	      }
	      return results;
	    });
	    $rootScope.$on('auth:registration-email-error', function(ev, data) {
	      var errors;
	      errors = _(data.errors).map(function(v, k) {
	        return k + ": " + v + ".";
	      }).value().join("<br/>");

	      $modal({
	        title: "Error",
	        html: true,
	        content: "<div id='alert-registration-email-failed' class='alert alert-danger' role='alert'>Unable to register.<br/>" + data.errors.full_messages + "</div>"
	      });
	    });
	    $rootScope.$on('auth:email-confirmation-success', function(ev, data) {
	      $modal({
	        title: "Success!",
	        html: true,
	        content: "<div id='alert-email-confirmation-success'>Welcome " + data.email + ". Your account has been successfully created." + "</div>"
	      });
	    });
	    $rootScope.$on('auth:email-confirmation-error', function(ev, data) {
	      $modal({
	        title: "Error!",
	        html: true,
	        content: "<div id='alert-email-confirmation-error'>Unable to confirm " + "your account. Request a password reset to verify your identity." + "</div>"
	      });
	    });
	    $rootScope.$on('auth:password-reset-request-success', function(ev, params) {
	      $modal({
	        title: "Success",
	        html: true,
	        content: "<div id='alert-password-reset-request-success'>Password reset " + "instructions have been sent to " + params.email + "</div>"
	      });
	    });
	    $rootScope.$on('auth:password-reset-request-error', function(ev, data) {
	      $modal({
	        title: "Error",
	        html: true,
	        content: "<div id='alert-password-reset-request-error'>Error: " + _.map(data.errors).toString() + "</div>"
	      });
	    });
	    $rootScope.$on('auth:password-reset-confirm-error', function(ev, data) {
	      $modal({
	        title: "Error",
	        html: true,
	        content: "<div id='alert-password-reset-request-error'>Error: " + _.map(data.errors).toString() + "</div>"
	      });
	    });
	    passwordChangeModal = $modal({
	      title: "Change your password!",
	      html: true,
	      show: false,
	      contentTemplate: 'views/user_registrations/password-reset-modal.html'
	    });
	    passwordChangeSuccessModal = $modal({
	      title: "Success",
	      html: true,
	      show: false,
	      content: "<div id='alert-password-change-success'>Your password " + "has been successfully updated."
	    });
	    passwordChangeErrorScope = $rootScope.$new();
	    passwordChangeErrorModal = $modal({
	      title: "Error",
	      html: true,
	      show: false,
	      scope: passwordChangeErrorScope,
	      contentTemplate: 'views/user_registrations/password-change-error-modal.html'
	    });
	    $rootScope.showPasswordChangeModal = function() {
	      return passwordChangeModal.show();
	    };
	    $rootScope.$on('auth:password-reset-confirm-success', function() {
	      return passwordChangeModal.show();
	    });
	    $rootScope.$on('auth:password-change-success', function() {
	      passwordChangeModal.hide();
	      return passwordChangeSuccessModal.show();
	    });
	    $rootScope.$on('auth:password-change-error', function(ev, data) {
	      passwordChangeErrorScope.errors = data.errors;
	      passwordChangeModal.hide();
	      return passwordChangeErrorModal.show();
	    });
	    passwordChangeErrorScope.$on('modal.hide', function() {
	      return passwordChangeModal.show();
	    });
	    $rootScope.$on('auth:login-success', function(ev, user) {
	      var field, ref, ref1, val;
	      $modal({
	        title: "Success",
	        html: true,
	        content: "<div id='alert-auth-login-success'><h2>Welcome back " + user.email + '</h2></div>'
	      });
	      ref = $rootScope.loginForm;
	      for (field in ref) {
	        val = ref[field];
	        delete $rootScope.loginForm[field];
	      }
	      ref1 = $rootScope.registrationForm;
	      for (field in ref1) {
	        val = ref1[field];
	        delete $rootScope.registrationForm[field];
	      }
	      return $state.go('home');
	    });
	    $rootScope.$on('auth:invalid', function() {
	      return $state.go('sign_in');
	    });
	    $rootScope.$on('auth:login-error', function(ev, data) {
	      $modal({
	        title: "Error",
	        html: true,
	        content: "<div id='alert-login-error'>Authentication failure: " + data.errors[0] + '</div>'
	      });
	    });
	    $rootScope.$on('auth:logout-success', function(ev) {
	      $modal({
	        title: 'Success',
	        html: true,
	        content: "<div id='alert-logout-success'>Goodbye</div>"
	      });
	    });
	    $rootScope.$on('auth:logout-error', function(ev) {
	      $modal({
	        title: 'Error',
	        html: true,
	        content: "<div id='alert-logout-error'>Unable to complete logout. " + "Please try again.</div>"
	      });
	    });
	    $rootScope.$on('auth:account-update-success', function() {
	      $modal({
	        title: 'Success',
	        html: true,
	        content: "<div id='alert-account-update-success'>Your account has been updated." + "</div>"
	      });
	    });
	    $rootScope.$on('auth:account-update-error', function(ev, data) {
	      var errors;
	      errors = _(data.errors).map(function(v, k) {
	        return k + ": " + v + ".";
	      }).value().join("<br/>");
	      $modal({
	        title: "Error",
	        html: true,
	        content: "<div id='alert-account-update-error'>Unable to update " + "your account. " + errors + "</div>"
	      });
	    });
	    $rootScope.$on('auth:account-destroy-success', function() {
	      $modal({
	        title: 'Success',
	        html: true,
	        content: "<div id='alert-account-destroy-success'>Your account has been destroyed." + "</div>"
	      });
	    });
	    return $rootScope.$on('auth:account-destroy-error', function(ev, data) {
	      var errors;
	      errors = _(data.errors).map(function(v, k) {
	        return k + ": " + v + ".";
	      }).value().join("<br/>");
	      $modal({
	        title: "Error",
	        html: true,
	        content: "<div id='alert-account-destroy-error'>Unable to destroy " + "your account. " + errors + "</div>"
	      });
	    });
	  }
	]);
}());
