<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WhatToBuy - Main page</title>
<link href="css/bootstrap.css" rel="stylesheet">
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
<body>
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
 <div class="container">
  <h3 class="text-center">Items to buy</h3>
  <ul class="list-group checked-list-box">
   <li class="list-group-item">Piens</li>
   <li class="list-group-item" data-checked="true">Maize</li>
   <li class="list-group-item">Alus</li>
   <li class="list-group-item">Ziepes</li>
  </ul>
 </div>
 
 <div id="addItemDialog" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"></button>
                <h4 class="modal-title">Add item</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                 <div class="row">
                  <div class="col-md-3"><p><label for="itemName">Item Name</label></div>
                  <div class="col-md-9"><p><input type="text" id="itemName" class="form-control" required autofocus> </div>
                 <div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Add</button>
            </div>
        </div>
    </div>
</div></div></div>

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
                <button type="button" class="btn btn-primary">Yes</button>
            </div>
        </div>
    </div>
</div>

<div id="confirmLogoutDialog2" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      ...
    </div>
  </div>
</div>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 <script src="js/bootstrap.js"></script>
 <script type="text/javascript">
 
 $(function() {
		$('.list-group.checked-list-box .list-group-item').each(
			function() {
				var $item = $(this);
				
				var $checkBox = $("<input>", {
					type:"checkbox"
				});
				
				$checkBox.prependTo($item);
				
				$item.on('click', function () {
					$checkBox.prop('checked', !$checkBox.is(':checked'));
					$checkBox.triggerHandler('change');
					if ($checkBox.is(':checked')) {
						$(this).addClass("active");
					} else {
						$(this).removeClass("active");
					}
		        });
				
			});
		
	 });
 
 
 </script>
 
</body>
</html>