'use strict';
(function() {
    angular
        .module('app')
        .controller('plotController', plotController);

        function plotController($http) {
        	$http
				.get('/viewPlotInformation')
				.then(function(response){
					console.log(response);
				});
        }


})();