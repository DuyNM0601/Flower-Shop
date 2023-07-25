<%-- 
    Document   : changeprofile.jsp
    Created on : Mar 5, 2023, 9:04:31 AM
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
            String email = (String) session.getAttribute("email");
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
            <h3>Change Profile</h3>
            <h3><a href="mainController?action=logout">Logout</a></h3>
        </section>
        <section>
            <form action="mainController?email=<%=email%>" method="post" class="form_changeprofile">
            <table>
                <tr>
                    <td>New Fullname</td>
                    <td><input type="text" name="txtnewfullname"></td>
                </tr>
                <tr>
                    <td>New Phone</td>
                    <td><input type="text" name="txtnewphone"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="changeprofile" name="action"></td>
                </tr>
            </table>
        </form>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        <%
            }
        %>
    </body>
</html>
