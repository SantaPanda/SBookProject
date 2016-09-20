<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<html>
<head>
</head>
<body>
<%!
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String ADDRESS = "jdbc:mysql://localhost:3306/webproject1";
    private static final String USER = "root";
    private static final String PASSWORD = "Weijie033";
%>
<%
    int count=0;
    request.setCharacterEncoding("utf-8");
    Class.forName(DRIVER);	// 加载驱动.
    Connection conn = (Connection) DriverManager.getConnection(ADDRESS, USER, PASSWORD);
    //链接数据库.
    //获取session_times,判断是否是第一次进入queryprice.
    int times = (int)session.getAttribute("times");
    if(times == 0) {
        int getbookid = Integer.parseInt(request.getParameter("bookid"));
        String getImagepath = request.getParameter("Imagepath");
        session.setAttribute("bookid", getbookid);
        session.setAttribute("Imagepath", getImagepath);
    }
    int querybookid = (int)session.getAttribute("bookid");
    Statement statement = (Statement)conn.createStatement();
    String sql = "select * from bookinformation where id="+querybookid;
    ResultSet rs = statement.executeQuery(sql);
    String bname = null;
    int fprice = 0;
    int sprice = 0;
    int tprice = 0;
    //一口价
    int initialprice = 10;
    rs.last();
    bname = rs.getString(2);
    fprice = rs.getInt(4);
    sprice = rs.getInt(5);
    tprice = rs.getInt(6);
    initialprice = rs.getInt(7);
    //会话传递book的信息.
    session.setAttribute("bookname", bname);
    session.setAttribute("firstprice", fprice);
    session.setAttribute("secondprice", sprice);
    session.setAttribute("thirdprice", tprice);
    session.setAttribute("initialprice", initialprice);

    count=rs.getRow();

    rs.close();	//关闭返回值.
    conn.close();	//断开数据库链接.

%>

<script type="text/javascript">
    var temp = "<%=count%>";
    if(temp==1){
        <!--跳转下一个JSP-->
        window.location.href = "bargain.jsp";
    }
    else{
        alert("false:no data in mysql.");
        window.location.href = "index.jsp";
    }
</script>

</body>
</html>
