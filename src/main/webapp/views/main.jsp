<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WhatToBuy - Main page</title>
<link href="../css/bootstrap.css" rel="stylesheet">
<style type="text/css">
.form-signin {
 margin: 0 auto;
 min-width: 300px;
 max-width: 400px;
}

.btn-sign {
 margin-top: 15px;
}

.form-control {
 margin-bottom: 10px;
}

.list-group-item {
 cursor:pointer;
}

</style>
</head>
<body ng-app="whatToByApp" ng-controller="ItemController">
 <nav class="navbar navbar-inverse">
  <div class="container-fluid">
   <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
     <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="#">What To Buy</a>
   </div>
   <div class="collapse navbar-collapse" id="myNavbar">
    <ul class="nav navbar-nav">
     <li class="active"><a href="#" data-toggle="modal" data-target="#addItemDialog">Add Item</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
     <li><a href="#" id="logoutLink" data-toggle="modal" data-target="#confirmLogoutDialog"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
   </div>
  </div>
 </nav>
 
 <div class="container" > <!-- TODO (RV): ng-controller="ItemController" -->
  <h3 class="text-center">Items to buy</h3>
  <ul class="list-group checked-list-box" >
   <span ng-repeat="item in data.requests">
    <li class="list-group-item" 
     on-long-press="showDeleteConfirmation($index)" 
     ng-click="changeStatus($index)"
     ng-class="{'active' : item.status == true}">{{item.name}}</li>
   </span>
  </ul>
 </div>
 
 <div id="addItemDialog" class="modal fade" > <!-- TODO (RV): ng-controller="ItemController" -->
  <div class="modal-dialog">
    <div class="modal-content">
     <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal"></button>
      <h4 class="modal-title">Add item</h4>
     </div>
     <div class="modal-body">
      <div class="container-fluid">
       <div class="row">
        <div class="col-md-3">
         <p>
          <label for="itemName">Item Name</label>
        </div>
        <div class="col-md-9">
         <p>
          <input type="text" id="itemName" class="form-control" required autofocus ng-model="itemName">
        </div>
        <div></div>
       </div>
       <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" ng-click="addItem()" ng-model="itemName">Add</button>
       </div>
      </div>
     </div>
    </div>
  </div>
 </div>
 
 <div id="confirmLogoutDialog" class="modal fade bs-example-modal-lg">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
        <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"></button>
                <h4 class="modal-title">Logout</h4>
            </div>
          <h4>Do you want to logout?</h4>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                <a href="<c:url value="../logout" />" class="btn btn-primary">Yes</a>
            </div>
        </div>
    </div>
</div>

<div id="confirmDeleteDialog" class="modal fade bs-example-modal-lg" > <!-- TODO (RV): ng-controller="ItemController" -->
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
        <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"></button>
                <h4 class="modal-title">Delete?</h4>
            </div>
          <h4>Do you want to delete item?</h4>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                <button type="button" class="btn btn-primary" ng-click="deleteItem()">Yes</button>
            </div>
        </div>
    </div>
</div>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
 <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.js"></script>
 
 <script src="../js/bootstrap.js"></script>
 
 <script type="text/javascript">
 
 </script>
 
 <script>
		
		var whatToByApp = angular.module("whatToByApp", []);
		
		whatToByApp.directive('onLongPress', function($timeout) {
			return {

				restrict : 'A',

				link : function($scope, $elm, $attrs) {

					$elm.bind('mousedown', function(evt) {
						console.log('mousedown');
						$scope.longPress = true;
						$timeout(function() {
							if ($scope.longPress) {

								$scope.$apply(function() {
									$scope.$eval($attrs.onLongPress);
								});

							}
						}, 600);
					});

					$elm.bind('mouseup', function(evt) {
						console.log('mouseup');
						$scope.longPress = false;
					});

				}
			};
		});
		
		whatToByApp.controller("ItemController", function($scope, $rootScope, $http) {
			
			$scope.data = {};

			updateTable($scope, $http);
			
			$scope.addItem = function() {
				addItem($scope, $http);
			};
			
			$scope.changeStatus = function(index) {
				changeStatus($scope, $http, index);
			};
			
			$scope.showDeleteConfirmation = function(index) {
				showDeleteConfirmation($rootScope, $scope, $http, index);
			};

			$scope.deleteItem = function() {
				deleteItem($scope, $rootScope, $http);
			};

		});

		function showDeleteConfirmation(rootScope, scope, http, index) {
			rootScope.itemToDatele = scope.data.requests[index].id;
			$("#confirmDeleteDialog").modal("show");
		}

		function deleteItem(scope, rootScope, http) {

			var request = http({
				method : "post",
				url : "../itemservice/delete/" + rootScope.itemToDatele,
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded'
				}
			});

			request.success(function(data, status, headers, config) {
				$('#confirmDeleteDialog').modal('hide');
				
				updateTable(scope, http);
			});

			request.error(function(data, status, headers, config) {
				// TODO (RV): add impl.
			});
		}

		function changeStatus(scope, http, index) {
			scope.data.requests[index].status = !scope.data.requests[index].status;

			var request = http({
				method : "post",
				url : "../itemservice/changeStatus/" + scope.data.requests[index].id
						+ "/" + scope.data.requests[index].status,
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded'
				}
			});

			request.success(function(data, status, headers, config) {
				updateTable(scope, http);
			});

			request.error(function(data, status, headers, config) {
				// TODO (RV): add impl.
			});

		}

		function addItem(scope, http) {

			var transform = function(data) {
				return $.param(data);
			};

			var request = http({
				method : "post",
				url : "../itemservice/add",
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded'
				},
				data : {
					name : scope.itemName
				},
				transformRequest : transform
			});

			request.success(function(data, status, headers, config) {
				$('#addItemDialog').modal('hide');
				
				updateTable(scope, http);
				
			});

			request.error(function(data, status, headers, config) {
				// TODO (RV): add impl.
			});

		}

		function updateTable(scope, http) {
			
			var responsePromise = http.get("../itemservice/getItems");
			responsePromise.success(function(data, status, headers, config) {
				scope.data.requests = data;
				
				console.log(data);
				console.log(scope.data.requests);
				
			});
			responsePromise.error(function(data, status, headers, config) {
				// TODO (RV): add impl.
			});
			
		}
	</script>
 
</body>
</html>