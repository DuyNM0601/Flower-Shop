<%-- 
    Document   : changed
    Created on : Mar 5, 2023, 10:29:53 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <%
            String name = (String) session.getAttribute("name");
            if (name == null) {

        %>        
        <p><font color="red">You must login to view personal page</font></p>
        <p></p>
        <%  } else {
        %>
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <section>
            <h3><a href="mainController?action=logout">Logout</a></h3>
            <a href="personalPage.jsp">View all orders</a>
            <h3>Your profile was changed</h3>
        </section>
        <section>
            <%
                String email = (String) session.getAttribute("email");
                String fullname = (String) request.getParameter("txtnewfullname");
                String phone = (String) request.getParameter("txtnewphone");
            %>
            <p>Your email: <%= email%></p>
            <p>Your fullname: <%= fullname%></p>
            <p>Your phone: <%= phone%></p>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        <%

            }
        %>
    </body>
</html>
