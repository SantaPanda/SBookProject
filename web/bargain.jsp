
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
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

</head>
<body>

<div id="fh5co-offcanvass">
    <a href="#" class="fh5co-offcanvass-close js-fh5co-offcanvass-close">Menu <i class="icon-cross"></i> </a>
    <h1 class="fh5co-logo"><a class="navbar-brand" href="index.jsp">SBook</a></h1>
    <ul>
        <div class="row">
            <div class="col-md-4">
                <img src="images/img_hd.jpg" class="img-circle" alt="CinqueTerre" width="50" height="50">
            </div>
            <div class="col-md-8">
                <%String name = (String)session.getAttribute("nowUsername");%>
                <h3 class="text-primary"><%=name%></h3>
            </div>
        </div>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="about.jsp">About</a></li>
        <li><a href="login.jsp">Login</a></li>
        <li><a href="enroll.jsp">Enroll</a></li>
    </ul>
    <h3 class="fh5co-lead">Connect with us</h3>
    <p class="fh5co-social-icons">
        <a href="#"><i class="icon-twitter"></i></a>
        <a href="#"><i class="icon-facebook"></i></a>
        <a href="#"><i class="icon-instagram"></i></a>
        <a href="#"><i class="icon-dribbble"></i></a>
        <a href="#"><i class="icon-youtube"></i></a>
    </p>
</div>
<header id="fh5co-header" role="banner">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <a href="#" class="fh5co-menu-btn js-fh5co-menu-btn">Menu <i class="icon-menu"></i></a>
                <a class="navbar-brand" href="index.jsp">SBook</a>
            </div>
        </div>
    </div>
</header>
<!-- END .header -->

<%String Bimagepath = (String) session.getAttribute("Imagepath");
String Bookname = (String)session.getAttribute("bookname");
int firstprice = (int)session.getAttribute("firstprice");
int secondprice = (int)session.getAttribute("secondprice");
int thirdprice = (int)session.getAttribute("thirdprice");
int initialprice = (int)session.getAttribute("initialprice");%>

<div id="fh5co-main">
    <div class="container" style="position: absolute;top: 140px;">
        <div class="col-md-offset-2">
            <div class="col-md-4">
                <h3 class="text-primary">Bargain!</h3>
                <div class="fh5co-spacer fh5co-spacer-sm"></div>
                    <img src="<%=Bimagepath%>" alt="Free HTML5 template by FREEHTML5.co" class="img-rounded img-responsive">
            </div>
            <div class="col-md-8">
                <div style="position:absolute; left:50px; top:120px;">
                    <div class="form-group">
                        <font style="font-size:30px">Bookname:  </font><span style="font-size:30px"><%=Bookname%></span>
                    </div>
                    <div class="form-group">
                        <font style="font-size:30px">Initial price:  </font><span style="font-size:30px">$<%=initialprice%></span>
                    </div>

                    <%//判断bargain页面显示的内容.
                    int count=0;
                    if(firstprice>0){
                        count++;
                        if(secondprice>0){
                            count++;
                            if(thirdprice>0)
                                count++;
                        }
                    }
                    switch(count){
                        case 0:out.print(
                                        "<div class=\"form-group\"><font style=\"font-size:30px\">No one bidding!</font></div>"+
                                        "<form action=\"refreshprice.jsp\" method=\"post\">\n"+
                                                //限制输入框内只能输入数字
                                        "<div class=\"form-group\"><input onkeyup=\"value=value.replace(/[^\\d]/g,'') \" onbeforepaste=\"clipboardData.setData('text',clipboardData.getData('text').replace(/[^\\d]/g,''))\""
                                                +" type=\"text\" name=\"price1\" class=\"form-control\" placeholder=\"Input your price\"></div>"+
                                        "<input type=\"submit\" class=\"btn btn-primary btn-lg\" value=\"Submit\" style=\"text-shadow: black 5px 3px 3px;\">"+
                                        "</form>"
                               );
                            session.setAttribute("returnvalue","price1");
                            session.setAttribute("pricepath",1);
                            break;
                        case 1:out.print(
                                        "<div class=\"form-group\"><font style=\"font-size:30px\">Highest price:  </font>" +
                                        "<span style=\"font-size:30px\">$"+firstprice+"</span></div>" +
                                        "<form action=\"refreshprice.jsp\" method=\"post\">\n"+
                                        "<div class=\"form-group\"><input onkeyup=\"value=value.replace(/[^\\d]/g,'') \" onbeforepaste=\"clipboardData.setData('text',clipboardData.getData('text').replace(/[^\\d]/g,''))\""
                                                +" type=\"text\" name=\"price2\" class=\"form-control\" placeholder=\"Input your price\"></div>"+
                                        "<input type=\"submit\" class=\"btn btn-primary btn-lg\" value=\"Submit\" style=\"text-shadow: black 5px 3px 3px;\">"+
                                        "</form>"
                               );
                            session.setAttribute("returnvalue","price2");
                            session.setAttribute("pricepath",2);
                            break;
                        case 2:out.print(
                                        "<div class=\"form-group\"><font style=\"font-size:30px\">Highest price:  </font>" +
                                        "<span style=\"font-size:30px\">$"+secondprice+"</span></div>" +
                                        "<form action=\"refreshprice.jsp\" method=\"post\">\n"+
                                        "<div class=\"form-group\"><input onkeyup=\"value=value.replace(/[^\\d]/g,'') \" onbeforepaste=\"clipboardData.setData('text',clipboardData.getData('text').replace(/[^\\d]/g,''))\""
                                                +" type=\"text\" name=\"price3\" class=\"form-control\" placeholder=\"Input your price\"></div>"+
                                        "<input type=\"submit\" class=\"btn btn-primary btn-lg\" value=\"Submit\" style=\"text-shadow: black 5px 3px 3px;\">"+
                                        "</form>"
                               );
                            session.setAttribute("returnvalue","price3");
                            session.setAttribute("pricepath",3);
                            break;
                        case 3:out.print(
                                        "<div class=\"form-group\"><font style=\"font-size:30px\">Highest price:  </font>" +
                                        "<span style=\"font-size:30px\">$"+thirdprice+"</span></div>" +
                                        "<form action=\"refreshprice.jsp\" method=\"post\">\n"+
                                        "<div class=\"form-group\"><input onkeyup=\"value=value.replace(/[^\\d]/g,'') \" onbeforepaste=\"clipboardData.setData('text',clipboardData.getData('text').replace(/[^\\d]/g,''))\""+
                                                " type=\"text\" name=\"price4\" class=\"form-control\" placeholder=\"Input your price\"></div>"+
                                        "<input type=\"submit\" class=\"btn btn-primary btn-lg\" value=\"Submit\" style=\"text-shadow: black 5px 3px 3px;\">"+
                                        "</form>"
                               );
                            session.setAttribute("returnvalue","price4");
                            session.setAttribute("pricepath",4);
                            break;
                    }%>
                </div>
            </div>
        </div>
    </div>
</div>
<!--
<footer id="fh5co-footer">

    <div class="container">
        <div class="row row-padded">
            <div class="col-md-12 text-center">
                <p class="fh5co-social-icons">
                    <a href="#"><i class="icon-twitter"></i></a>
                    <a href="#"><i class="icon-facebook"></i></a>
                    <a href="#"><i class="icon-instagram"></i></a>
                    <a href="#"><i class="icon-dribbble"></i></a>
                    <a href="#"><i class="icon-youtube"></i></a>
                </p>
                <p><small>&copy; SBook Free HTML5 Template. All Rights Reserved. <br>More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a> | Images by: <a href="http://pexels.com" target="_blank">Pexels</a> </small></p>
            </div>
        </div>
    </div>
</footer>
-->

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




</body>
</html>
