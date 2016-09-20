<%--
  Created by IntelliJ IDEA.
  User: Santa
  Date: 16/6/26
  Time: 上午11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SBook &mdash; Webproject </title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
    <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
    <meta name="author" content="FREEHTML5.CO" />

    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content="" />
    <meta name="twitter:image" content="" />
    <meta name="twitter:url" content="" />
    <meta name="twitter:card" content="" />

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="favicon.ico">

    <!-- Google Webfonts -->
    <link href='http://fonts.useso.com/css?family=Roboto:400,300,100,500' rel='stylesheet' type='text/css'>
    <link href='http://fonts.useso.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

    <!-- Animate.css -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="css/icomoon.css">
    <!-- Magnific Popup -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <!-- Salvattore -->
    <link rel="stylesheet" href="css/salvattore.css">
    <!-- Theme Style -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Modernizr JS -->
    <script src="js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="js/bootstrap-filestyle.min.js"> </script>

</head>
<body>


<form  method="post" action="addbook.jsp">

    <div id="fh5co-main">
        <div class="container" style="position: absolute;top: 60px;">
            <div class="col-md-offset-3">
                <div class="col-md-8">
                    <div class="form-group">
                        <%String name = (String)session.getAttribute("nowUsername");%>
                        <font style="font-size:30px">Saler:  </font><span style="font-size:30px"><%=name%></span>
                    </div>
                    <div class="form-group">
                        <font style="font-size:30px">Bookname:  </font>
                        <input type="text" name="Nbookname" class="form-control" placeholder="Input your bookname.">
                    </div>
                    <div class="form-group">
                        <font style="font-size:30px">InitialPrice:  </font>
                        <input onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                             type="text" name="Nbookprice" class="form-control" placeholder="Input your price">
                    </div>
                    <div class="form-group">
                        <font style="font-size:30px">ImagePath:  </font>
                        <input type="file" name="theFile" onchange="document.getElementById('theFilePath').value=this.value; document.getElementById('Path_show').value=this.value;"/>
                        <input type="hidden" id="theFilePath" name="theFilePath" value="">
                        <input type="text" id="Path_show" value="" class="form-control" placeholder="Please choose a picture from your pc.">
                    </div>
                    <div class="form-group">
                        <font style="font-size:30px">Profile:</font>
                        <input type="text" name="profile" class="form-control" style="height: 240px" placeholder="Input the profile of your book!"></input>
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary btn-lg" value="Add Book" style="text-shadow: black 5px 3px 3px;">
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

</body>


<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="js/jquery.waypoints.min.js"></script>
<!-- Magnific Popup -->
<script src="js/jquery.magnific-popup.min.js"></script>
<!-- Salvattore -->
<script src="js/salvattore.min.js"></script>
<!-- Main JS -->
<script src="js/main.js"></script>
</html>
