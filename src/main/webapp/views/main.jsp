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
     <li class="active"><a href="#" id="addItemLInk">Add Item</a></li>
     <li><a href="#">TODO</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
     <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
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
		
		$("#addItemLInk").on('click', function () {
			$("#addItemLInk").modal('show');
		});
		
	 });
 
 /*
 $(function () {
	    $('.list-group.checked-list-box .list-group-item').each(function () {
	        // Settings
	        var $widget = $(this);
	        var $checkbox = $('<input type="checkbox" class="hidden" />');
	        var color = ($widget.data('color') ? $widget.data('color') : "primary");
	        var style = ($widget.data('style') == "button" ? "btn-" : "list-group-item-");
	        var settings = {
	                on: {
	                    icon: 'glyphicon glyphicon-check'
	                },
	                off: {
	                    icon: 'glyphicon glyphicon-unchecked'
	                }
	            };
	            
	        $widget.css('cursor', 'pointer')
	        $widget.append($checkbox);

	        // Event Handlers
	        $widget.on('click', function () {
	            $checkbox.prop('checked', !$checkbox.is(':checked'));
	            $checkbox.triggerHandler('change');
	            updateDisplay();
	        });
	        $checkbox.on('change', function () {
	            updateDisplay();
	        });
	          

	        // Actions
	        function updateDisplay() {
	            var isChecked = $checkbox.is(':checked');

	            // Set the button's state
	            $widget.data('state', (isChecked) ? "on" : "off");

	            // Set the button's icon
	            $widget.find('.state-icon')
	                .removeClass()
	                .addClass('state-icon ' + settings[$widget.data('state')].icon);

	            // Update the button's color
	            if (isChecked) {
	                $widget.addClass(style + color + ' active');
	            } else {
	                $widget.removeClass(style + color + ' active');
	            }
	        }
			
	        updateDisplay();
	        
	        // Initialization
	        function init() {
	            
	            if ($widget.data('checked') == true) {
	                $checkbox.prop('checked', !$checkbox.is(':checked'));
	            }
	            
	            updateDisplay();

	            // Inject the icon if applicable
	            if ($widget.find('.state-icon').length == 0) {
	                $widget.prepend('<span class="state-icon ' + settings[$widget.data('state')].icon + '"></span>');
	            }
	        }
	        init();
	    });
	});
 */
 </script>
 
 <div id="addItemDialog" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"></button>
                <h4 class="modal-title">Add item</h4>
            </div>
            <div class="modal-body">
                TODO
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Add</button>
            </div>
        </div>
    </div>
</div>
 
</body>
</html>