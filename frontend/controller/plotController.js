'use strict';
(function() {
    angular
        .module('app')
        .controller('plotController', plotController);

        function plotController($http) {
            var vm = this;

            vm.view = view;

        	$http
				.get('/viewPlotInformation')
				.then(function(response){
					console.log(response);
				});
        }


})();