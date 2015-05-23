angular.module("projectApp", ['ngRoute'])

// configuration
.config(['$routeProvider', function($routeProvider) {
	$routeProvider
	.when('/:project', {
		// #/test
		templateUrl: '/assets/project_app/views/project.html',
		controller: 'ProjectCtrl'
	})
	// end /project index
	
	.when('/:project/:page', {
		templateUrl: function(params) {
			return '/assets/project_app/views/project_' + params.page + '.html';
		},
		controller: 'ProjectCtrl'
	})
	
	; // end $routeProvider statement
	// end project route
	// end routes
}])

// services
// blog service
.factory('BlogService', function($http) {
	return {
		getPosts: function(params) {
			var url;
			if (params.id) {
				url = '/blog/' + params.id + '.json';
			}
			else {
				url = '/blog.json';	
			}
			// get just that one
			$http.get(url).success(function(data, status, headers, config) {
				console.log(data);	
			});
			
		} // end getPosts method
	};
}) 
// end blogservice

// project service
.factory('ProjectService', function($http) {
	return  {
		getProjects: function(params) {
			if (!params) {
				return {
					error: "please provide parameters"
				};
			}
			// get a list of projects based on params	
			$http.get('/project/list.json').success(function(data, status, headers, config) {
				var projects = angular.fromJson(data);
				if (params.url) {
					// return only the desired project data
					for (var i = 0; i < projects.length; i++) {
						if (projects[i].url == params.url) {
							projects = [projects[i]];
						}
					} // end iterator
					if (projects[0].url != params.url) {
						// must not have made it happen
						// let's 404 it
						//window.location = "/404.html";
					}
				} // end url check
				params.callback(projects);
			});
		} // end getProjects method
	};
}) // end projectservice factory

// end services


// controllers
.controller('ProjectCtrl', function($scope, $routeParams, ProjectService) {
	$scope.project = {};
	$scope.loadProject = function() {
		ProjectService.getProjects({
			callback: function(projects) {
				$scope.project = projects[0];
			}, 
			url: "/" + $routeParams.project
		});
	}; // end loadProject method
	
	$scope.loadProject();
}) // end Project controller

.controller('MainCtrl', function($scope, ProjectService) {

}) // end main controller

; // end module











