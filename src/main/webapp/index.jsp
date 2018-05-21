<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>Chat Bot</title>
      <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>

      <link rel="stylesheet" href="css/style.css">
</head>

<body>
<div class="row">
    <div class="col-md-6 col-md-offset-3">
        <form id="msform" action="initial" method="post">
            <!-- progressbar -->
            <ul id="progressbar">
                <li class="active">Step 1</li>
                <li>Step 2</li>
            </ul>
            <!-- fieldsets -->
            <fieldset>
                <h2 class="fs-title">Chat Bot</h2>
                <h3 class="fs-subtitle">What is Your Student Id / Name</h3>
                <input class="form-control" type="text" name="sid" placeholder="Please enter your student ID / Name" required/>
                <input type="button" name="next" class="next action-button" value="Next"/>
            </fieldset>
            <fieldset>
                <h2 class="fs-title">Chat Bot</h2>
                <h3 class="fs-subtitle">You are an existing student?</h3>
                <select name="existstud" class="form-control">
                   <option value="yes">YES</option>
                   <option value="no">No</option>
               </select>
                <input type="submit" name="StartBot" class="action-button" value="StartBot"/>
            </fieldset>
           
        </form>
    </div>
</div>
<!-- /.MultiStep Form -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>

    <script  src="js/index.js"></script>

</body>

</html>
