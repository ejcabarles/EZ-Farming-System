'use strict';
(function() {
    angular
        .module('app')
        .directive('header', header);
    
    function header() {
        var directive = {
            restrict: 'E',
            templateUrl: '/header',
            controller: 'headerController',
            controllerAs: 'header'
        }
        return directive;
    }
})();