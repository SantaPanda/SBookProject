
<%@ page import="java.sql.*"%>
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

    <script type="text/javascript">
//错误的传参方式.html传参jsp最好用POST或者GET方法.
//        function Ensureprice1(){
//            alert("Price:$10,you can bargain!");
//            location.href = "translate1.jsp";
//        }
//        function Ensureprice2(){
//            alert("Price:$10,you can bargain!");
//            location.href = "translate2.jsp";
//        }
//        window.onload = function(){
//            document.onclick = function(e){
//                var cookie;
//                var target = e.target|| e.srcElement;
//                alert(target.id);
//                cookie = target.id;
//                document.cookie = cookie;
//                location.href = "translate1.jsp";
//            }
//        }

        //检测是否登录,是否能使用Addbook功能.
        function checklogin(){
            var a = document.getElementById("isAddbook").value;
            if(a == 'null'){
                alert("Please login first!");
            }
            else window.location.href = "salebook.jsp";
        }
    </script>
</head>
<body>

<div id="fh5co-offcanvass">
    <a href="#" class="fh5co-offcanvass-close js-fh5co-offcanvass-close">Menu <i class="icon-cross"></i> </a>
    <h1 class="fh5co-logo"><a class="navbar-brand" href="index.jsp">SBook</a></h1>

    <a>
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
            <li class="active"><a href="index.jsp">Home</a></li>
            <li><a href="about.jsp">About</a></li>
            <li><a onclick="checklogin()">SaleBook</a></li>
            <input type="hidden" id="isAddbook" value="<%=name%>">
            <li><a href="controlbook.jsp">Form</a></li>
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
    </a>
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
    <form action="" method="post">
        <div class="col-md-offset-4">
            <div class="col-md-7">
                <div class="input-group">
                    <input type="text" class="form-control">
                       <span class="input-group-btn">
                           <button class="btn btn-default" type="button">
                           Search
                           </button>
                       </span>
                </div><!-- /input-group -->
            </div><!-- /.col-lg-6 -->
        </div>
    </form>
</header>
<!-- END .header -->
<div id="fh5co-main">
    <%//表示是否多次跳转queryprice.jsp页面.防止影响传参.
        session.setAttribute("times", 0);
    %>

    <div class="container">

        <div class="row">

            <div id="fh5co-board" data-columns>

                //链接数据库,获得书的信息.
                <%!
                    private static final String DRIVER = "com.mysql.jdbc.Driver";
                    private static final String ADDRESS = "jdbc:mysql://localhost:3306/webproject1";
                    private static final String USER = "root";
                    private static final String PASSWORD = "Weijie033";
                %>
                <%
                    request.setCharacterEncoding("utf-8");
                    Class.forName(DRIVER);	// 加载驱动.
                    Connection conn = (Connection) DriverManager.getConnection(ADDRESS, USER, PASSWORD);
                    //链接数据库.
                    Statement statement = (Statement)conn.createStatement();
                    String sql = "select * from bookinformation";
                    ResultSet rs = statement.executeQuery(sql);
                    int booklist_id;
                    String booklist_imagepath;
                    int booklist_price;
                    String booklist_name;
                    String booklist_profile;
                    while(rs.next()){
                        booklist_id = rs.getInt(1);
                        booklist_name = rs.getString(2);
                        booklist_price = rs.getInt(7);
                        booklist_imagepath = rs.getString(8);
                        booklist_profile = rs.getString(11);
                        out.print("<div class=\"item\">\n" +
                                "                    <div class=\"animate-box\">\n" +
                                "                        <a href=" + booklist_imagepath + " class=\"image-popup fh5co-board-img\" title=\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, eos?\"><img src=" + booklist_imagepath + " alt=\"Free HTML5 Bootstrap template\"></a>\n" +
                                "                        <div style=\"position: absolute; right: 10px; top: 10px;\">\n" +
                                "                            <form action=\"queryprice.jsp\" method=\"post\">\n" +
                                "                                <input type=\"submit\" class=\"btn btn-primary btn-sm\" value=\"$"+ booklist_price +"\" style=\"text-shadow: black 3px 2px 2px;\">\n" +
                                "                                <input type=\"hidden\" name=\"bookid\" value="+ booklist_id +">\n" +
                                "                                <input type=\"hidden\" name=\"Imagepath\" value=" + booklist_imagepath + ">\n" +
                                "                            </form>\n" +
                                "                        </div>\n" +
                                "                        <div class=\"fh5co-desc\"><font size=\"4\" color=\"orange\">Bookname: "+ booklist_name +"</font></div>" +
                                "                        <div class=\"fh5co-desc\">Profile:</br> "+ booklist_profile + "</div>\n" +
                                "                    </div>\n" +
                                "                </div>");
                    }
                    rs.close();	//关闭返回值.
                    conn.close();	//断开数据库链接.
                %>

                <%--<div class="item">--%>
                    <%--<div class="animate-box">--%>
                        <%--<a href="images/img_1.jpg" class="image-popup fh5co-board-img" title="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, eos?"><img src="images/img_1.jpg" alt="Free HTML5 Bootstrap template"></a>--%>
                        <%--<div style="position: absolute; right: 10px; top: 10px;">--%>
                            <%--<form action="queryprice.jsp" method="post">--%>
                                <%--<input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">--%>
                                <%--<input type="hidden" name="bookid" value="1">--%>
                                <%--<input type="hidden" name="Imagepath" value="images/img_1.jpg">--%>
                            <%--</form>--%>
                        <%--</div>--%>
                        <%--<div class="fh5co-desc"><font size="4" color="orange">Bookname: Haluhalu</font></div>--%>
                        <%--<div class="fh5co-desc">Profile:</br>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, eos?</div>--%>
                    <%--</div>--%>
                <%--</div>--%>

                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_5.jpg" class="image-popup fh5co-board-img"><img src="images/img_5.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Tempora distinctio inventore, nisi excepturi pariatur tempore sit quasi animi.</div>
                    </div>
                </div>
                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_6.jpg" class="image-popup fh5co-board-img"><img src="images/img_6.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Sequi, eaque suscipit accusamus. Necessitatibus libero, unde a nesciunt repellendus!</div>
                    </div>
                </div>
                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_7.jpg" class="image-popup fh5co-board-img"><img src="images/img_7.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Necessitatibus distinctio eos ipsam cum hic temporibus assumenda deleniti, soluta.</div>
                    </div>
                </div>
                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_8.jpg" class="image-popup fh5co-board-img"><img src="images/img_8.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Debitis voluptatum est error nulla voluptate eum maiores animi quasi?</div>
                    </div>
                </div>
                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_9.jpg" class="image-popup fh5co-board-img"><img src="images/img_9.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Maxime qui eius quisquam quidem quos unde consectetur accusamus adipisci!</div>
                    </div>
                </div>
                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_21.jpg" class="image-popup fh5co-board-img"><img src="images/img_21.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Deleniti aliquid, accusantium, consectetur harum eligendi vitae quaerat reiciendis sit?</div>
                    </div>
                </div>
                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_10.jpg" class="image-popup fh5co-board-img"><img src="images/img_10.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Incidunt, eaque et. Et odio excepturi, eveniet facilis explicabo assumenda.</div>
                    </div>
                </div>
                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_11.jpg" class="image-popup fh5co-board-img"><img src="images/img_11.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Laborum dolores nihil voluptates quas alias distinctio fugiat tempora sit.</div>
                    </div>
                </div>
                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_12.jpg" class="image-popup fh5co-board-img"><img src="images/img_12.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Sit, quis nulla amet numquam fugit, in reiciendis laboriosam dolor.</div>
                    </div>
                </div>
                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_13.jpg" class="image-popup fh5co-board-img"><img src="images/img_13.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Possimus explicabo voluptatem natus nisi similique ipsa repudiandae? Quibusdam, fuga.</div>
                    </div>
                </div>
                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_14.jpg" class="image-popup fh5co-board-img"><img src="images/img_14.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Magni repellendus iusto mollitia, quibusdam facilis incidunt. Sunt, repellat, voluptatem.</div>
                    </div>
                </div>
                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_15.jpg" class="image-popup fh5co-board-img"><img src="images/img_15.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Unde iure rerum cupiditate explicabo quam aut vel earum numquam.</div>
                    </div>
                </div>
                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_16.jpg" class="image-popup fh5co-board-img"><img src="images/img_16.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Qui nisi error dolorum dolor delectus, alias doloremque perspiciatis nemo.</div>
                    </div>
                </div>
                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_18.jpg" class="image-popup fh5co-board-img"><img src="images/img_18.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Neque porro vero cumque natus nam voluptatibus, ratione, commodi labore.</div>
                    </div>
                </div>
                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_17.jpg" class="image-popup fh5co-board-img"><img src="images/img_17.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Quisquam quia totam, sit ea maxime sint sed excepturi quod.</div>
                    </div>
                </div>
                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_19.jpg" class="image-popup fh5co-board-img"><img src="images/img_19.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Nesciunt non iste ex nemo sapiente eum, provident nam corporis.</div>
                    </div>
                </div>
                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_20.jpg" class="image-popup fh5co-board-img"><img src="images/img_20.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Harum repellat labore est cum ipsa, nesciunt neque mollitia adipisci?</div>
                    </div>
                </div>

                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_22.jpg" class="image-popup fh5co-board-img"><img src="images/img_22.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Quos repellendus repudiandae debitis reprehenderit cupiditate cumque accusamus exercitationem, harum.</div>
                    </div>
                </div>
                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_23.jpg" class="image-popup fh5co-board-img"><img src="images/img_23.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Sunt numquam itaque delectus, dignissimos dolorem obcaecati vel, atque eos.</div>
                    </div>
                </div>
                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_24.jpg" class="image-popup fh5co-board-img"><img src="images/img_24.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Adipisci consequuntur ipsa fugit perspiciatis eligendi. Omnis blanditiis, totam placeat.</div>
                    </div>
                </div>
                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_25.jpg" class="image-popup fh5co-board-img"><img src="images/img_25.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Quos repellendus repudiandae debitis reprehenderit cupiditate cumque accusamus exercitationem, harum.</div>
                    </div>
                </div>
                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_26.jpg" class="image-popup fh5co-board-img"><img src="images/img_26.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Sunt numquam itaque delectus, dignissimos dolorem obcaecati vel, atque eos.</div>
                    </div>
                </div>
                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_27.jpg" class="image-popup fh5co-board-img"><img src="images/img_27.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Adipisci consequuntur ipsa fugit perspiciatis eligendi. Omnis blanditiis, totam placeat.</div>
                    </div>
                </div>
                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_28.jpg" class="image-popup fh5co-board-img"><img src="images/img_28.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Adipisci consequuntur ipsa fugit perspiciatis eligendi. Omnis blanditiis, totam placeat.</div>
                    </div>
                </div>
                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_29.jpg" class="image-popup fh5co-board-img"><img src="images/img_29.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Adipisci consequuntur ipsa fugit perspiciatis eligendi. Omnis blanditiis, totam placeat.</div>
                    </div>
                </div>
                <div class="item">
                    <div class="animate-box">
                        <a href="images/img_30.jpg" class="image-popup fh5co-board-img"><img src="images/img_30.jpg" alt="Free HTML5 Bootstrap template"></a>
                        <div style="position: absolute; right: 10px; top: 10px;">
                            <input type="submit" class="btn btn-primary btn-sm" value="$10" style="text-shadow: black 3px 2px 2px;">
                        </div>
                        <div class="fh5co-desc">Adipisci consequuntur ipsa fugit perspiciatis eligendi. Omnis blanditiis, totam placeat.</div>
                    </div>
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
<script type="text/javascript" src="js/bootstrap-filestyle.min.js"> </script>
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
