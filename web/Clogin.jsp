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
    String Loginname=request.getParameter("User");
    String Loginpasswd=request.getParameter("Password");
    Class.forName(DRIVER);	// ????.
    Connection conn = (Connection) DriverManager.getConnection(ADDRESS, USER, PASSWORD);
    //?????.
    Statement statement = (Statement)conn.createStatement();
    String sql = "select * from webusers where (account='"+Loginname+"'"+"and password='"+Loginpasswd+"')"+" or (email='"+Loginname+"'"+"and password='"+Loginpasswd+"')";
    boolean temp = false;
    ResultSet rs = statement.executeQuery(sql);
    String Username=null;
    if(rs.last())
        Username=rs.getString(2);
    count=rs.getRow();

    rs.close();	//?????.†
    conn.close();	//???????.

%>

<script type="text/javascript">
    var temp = "<%=count%>";
    if(temp==1){
        <!--?????JSP-->
        <%
        session.setAttribute("nowUsername", Username);%>
        window.location.href = "index.jsp";
    }
    else{
        alert("false account or password");
        window.location.href = "login.jsp";
    }
</script>

</body>
</html>
