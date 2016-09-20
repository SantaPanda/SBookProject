<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>


<html>
<head>
    <!--???????.-->
    <script type="text/javascript">

        function different(){
            alert("false security code");
            location.href = "enroll.jsp";
        }
    </script>
    <!--????-->
    <script type="text/javascript">

        function falseinput(){
            alert("false input");
            location.href = "enroll.jsp";
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
    String rand = session.getAttribute("code").toString();
    String input = request.getParameter("Vcode");
    int done=0;
    int count=0;
    request.setCharacterEncoding("utf-8");
    String Registername = request.getParameter("Efirstname")+request.getParameter("Elastname");
    String Registeraccount = request.getParameter("Eaccount");
    String Registerpasswd = request.getParameter("Epassword");
    String Registerepasswd = request.getParameter("Eepassword");
    String Registermail = request.getParameter("Eemail");
    //????????.
    if(Registerpasswd.equals(Registerepasswd) && Registername.length()>=3 && Registerpasswd.length()>=3 && Registeraccount.length()>=3) {
        //???????????.
        if (rand.equals(input)) {
            Class.forName(DRIVER);    //????.
            Connection conn = (Connection) DriverManager.getConnection(ADDRESS, USER, PASSWORD);
            Statement statement = (Statement) conn.createStatement();
            String sql1 = "select * from webusers where account='" + Registeraccount + "'" + "or email='" + Registermail + "'";
            ResultSet rs = statement.executeQuery(sql1);

            rs.last();
            count = rs.getRow();
            if (count == 1) {
                rs.close();
                conn.close();

            } else {
                rs.close();
                try {

                    String sql = "INSERT INTO webusers(name,account,email,password) VALUES(?,?,?,?)";

                    PreparedStatement ps = conn.prepareStatement(sql);


                    ps.setString(1, Registername);

                    ps.setString(2, Registeraccount);
                    ps.setString(3, Registermail);
                    ps.setString(4, Registerpasswd);


                    //????????.
                    ps.addBatch();

                    ps.executeBatch();

                    ps.close();

                    conn.close();

                    done = 1;

                } catch (SQLException e) {

                    e.printStackTrace();
                    System.out.print(e);

                }
            }
        }
        else {
            out.print("<script language='javascript'>different();</script>");
        }
    }
    else{
        out.print("<script language='javascript'>falseinput();</script>");
    }
%>

<script type="text/javascript">

    var temp = "<%=done%>";
    var temp1 = "<%=count%>";
    if(temp1==1){
        alert("account exist");
        window.location.href = "enroll.jsp";

    }
    if(temp==1){
        alert("success! login!");

        window.location.href = "login.jsp";
    }
    else{
        alert("register fail");
        window.location.href = "enroll.jsp";

    }

</script>

</body>
</html>
