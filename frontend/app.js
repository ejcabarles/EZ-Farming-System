'use strict';

var app = angular.module("app",["ngRoute"]);

//routes for angular app. configure routes
app.config(["$routeProvider", 
    function($routeProvider, $locationProvider){
        $routeProvider
            .when("/", {
                controller:"plotController",
                templateUrl:"view/plotView.html"
            })
            .otherwise({reDirectTo:"/"});
}]);