<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.NotUpdatable" %>


<html>
<head>
    <!--输入错误-->
    <script type="text/javascript">

        function falseinput(){
            alert("false input");
            location.href = "bargain.jsp";
        }
    </script>
</head>
<body>
<%!
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String ADDRESS = "jdbc:mysql://localhost:3306/webproject1";
    private static final String USER = "root";
    private static final String PASSWORD = "Weijie033";
%>
<%
    int done=0;
    request.setCharacterEncoding("utf-8");
    String parametename = (String)session.getAttribute("returnvalue");
    int pricepath = (int)session.getAttribute("pricepath");
    int bookid = (int)session.getAttribute("bookid");

    String pricepathInmyql = null;
    int firstprice = (int)session.getAttribute("firstprice");
    int secondprice = (int)session.getAttribute("secondprice");
    int thirdprice = (int)session.getAttribute("thirdprice");
    //判断是否输入正确
    boolean check = false;
    //判断是否没有输入数字
    String isinput_null = (String)request.getParameter(parametename);
    int refreshprice = 0;
    if(isinput_null.length() != 0) {
        refreshprice = Integer.parseInt(request.getParameter(parametename));
    }
    switch (pricepath){
        case 1:if(refreshprice>=1 && refreshprice<=10) {
            pricepathInmyql = "firstprice";
            check = true;
        }
            break;
        case 2:if(refreshprice>=firstprice && refreshprice<=10) {
            pricepathInmyql = "secondprice";
            check = true;
        }
            break;
        case 3:if(refreshprice>=secondprice && refreshprice<=10) {
            pricepathInmyql = "thirdprice";
            check = true;
        }
            break;
        case 4:if(refreshprice>=thirdprice && refreshprice<=10) {
            pricepathInmyql = "thirdprice";
            check = true;
        }
            break;
    }
    //判断是否输入正确.
    if(check) {
        //判断输入验证码是否正确.
        Class.forName(DRIVER);    //加载驱动.
        Connection conn = (Connection) DriverManager.getConnection(ADDRESS, USER, PASSWORD);
        Statement statement = (Statement) conn.createStatement();
        String sql = "UPDATE bookinformation SET "+pricepathInmyql+"="+refreshprice+" where id ="+bookid;
        statement.executeUpdate(sql);
        done = 1;
        if(done == 1){
            session.setAttribute("times", 1);
        }
    }
    else{
        out.print("<script language='javascript'>falseinput();</script>");
    }
%>

<script type="text/javascript">

    var temp = "<%=done%>";
    if(temp==1) {
        alert("Input succeed!");

        window.location.href = "queryprice.jsp";
    }

</script>

</body>
</html>
