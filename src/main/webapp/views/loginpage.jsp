<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WhatToBuy - Login page</title>
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

.login-error {
	margin-top: 15px;
	width: 250px;
}

</style>

</head>
<body>
	
	<div class="container">

      <form class="form-signin" action="<c:url value='login' />" method='POST'>
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="text" id="inputEmail" name="username" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
        <button class="btn btn-lg btn-primary btn-block btn-sign" type="submit">Sign in</button>
      </form>
      
      <c:if test="${param.error}">
      	<div class="center-block alert alert-danger login-error">
	  		<a class="close" data-dismiss="alert">×</a>
	  		<strong>Login failed!</strong>
	  		Either password or user name is wrong!
	  	</div>
      </c:if>
	</div>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
 <script src="js/bootstrap.js"></script>
 <script type="text/javascript">
 </script>
 
</body>
</html>