<%--
  Created by IntelliJ IDEA.
  User: Santa
  Date: 16/6/26
  Time: 下午2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.NotUpdatable" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String ADDRESS = "jdbc:mysql://localhost:3306/webproject1";
    private static final String USER = "root";
    private static final String PASSWORD = "Weijie033";
%>
<%
    request.setCharacterEncoding("utf-8");
    String saler = (String)session.getAttribute("nowUsername");
    String bookname = (String)request.getParameter("Nbookname");
    int bookprice = Integer.parseInt(request.getParameter("Nbookprice"));
    String imagepath = (String)request.getParameter("theFilePath");
    String bookprofile = (String)request.getParameter("profile");
    int done=0;

    String relativeImagepath = imagepath.substring(11, imagepath.length());
    relativeImagepath = "images/"+ relativeImagepath;

    Class.forName(DRIVER);    //链接数据库.
    Connection conn = (Connection) DriverManager.getConnection(ADDRESS, USER, PASSWORD);

    Statement statement = (Statement) conn.createStatement();
    String sql = "INSERT INTO bookinformation(name,price,imagepath,saleman,description) VALUES('"+ bookname +"','"+ bookprice +"','"+ relativeImagepath +"','"+ saler +"','"+ bookprofile+"')";
    statement.executeUpdate(sql);
    done = 1;

%>

</body>

<script type="text/javascript">

    var temp = "<%=done%>";
    if(temp==1){
        alert("Success!");
        window.location.href = "index.jsp";
    }
    else{
        alert("<%=imagepath%>");
        alert("Fail");

        window.location.href = "index.jsp";
    }

</script>

</html>
