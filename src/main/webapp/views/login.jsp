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

</style>

</head>
<body>
	
	<div class="container">

      <form class="form-signin">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <button class="btn btn-lg btn-primary btn-block btn-sign" type="submit">Sign in</button>
      </form>

    </div>
    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>