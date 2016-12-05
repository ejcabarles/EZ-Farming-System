'use strict';
(function() {
    angular
        .module('app')
        .directive('plot', plot);
    
    function plot() {
        var directive = {
            restrict: 'E',
            templateUrl: '/plots',
            controller: 'plotController',
            controllerAs: 'plot'
        }
        return directive;
    }
})();