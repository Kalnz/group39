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

    </head>
    <body>
            <h1 align="center">Feel Free To Ask!</h1>
            <h3 style="color: #0033ff" align="center">Welcome <%=session.getAttribute("sid")%></h3>
            <div class="container h-100">
                <div class="row">
                    <div class="col-md-10  h-50" >
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <span class="glyphicon glyphicon-comment"></span> Chat             
                            </div>
                            <div class="panel-body">
                                <ul class="chat" id="chat-window">
                                    <li class="left clearfix"><span class="chat-img pull-left">
                                            <img src="http://placehold.it/50/55C1E7/fff&text=Bot" alt="User Avatar" class="img-circle" />
                                        </span>
                                        <div class="chat-body clearfix">
                                            &nbsp; <p id="answer">
                                               Hello ???
                                            </p>
                                        </div>
                                    </li>
                                    
                                     <li class="left clearfix"><span class="chat-img pull-left">
                                            <img src="http://placehold.it/50/55C1E7/333&text=U" alt="User Avatar" class="img-circle" />
                                        </span>
                                        <div class="chat-body clearfix">
                                            &nbsp; <p id="human">
                                               
                                            </p>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                            <div class="panel-footer">
                                <div class="input-group">
                                    <input id="btn-input" type="text" class="form-control input-sm" placeholder="Ask Your Question here..." />
                                    <span class="input-group-btn">
                                        <button class="btn btn-warning btn-sm" id="btn-chat">
                                            Send</button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <!-- /.MultiStep Form -->
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
        
          <script type="text/javascript">
            $("#btn-chat").click(function () {
                $("#answer").html("");
                $("#human").html("");
                var val=$("#btn-input").val();
                $.post("bot",
                        {
                            ques: val
                        },
                        function (data, status) {
                           // console.log("Data: " + data + "\nStatus: " + status);
                           $('#btn-input').val('');
                            $("#answer").html(" "+data);
                            $("#human").html(val);
                        });
            });
            
        </script>

        
    </body>

</html>
