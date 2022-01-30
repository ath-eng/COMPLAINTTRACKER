<%-- 
    Document   : ViewGallery
    Created on : 23 Oct, 2021, 12:43:22 PM
    Author     : DREAM HOME
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <table border="1" align="center" cellpadding="10" style="border-collapse:collpase;">
                <tr>
                    <th>Sl.no</th>
                    <th>Image</th>
                    <th>Caption</th>
                   </tr>
                <%
                    String str1 = "select * from tbl_usergallery ug inner join tbl_usercomplaint uc on ug.usercomplaint_id=uc.usercomplaint_id where ug.usercomplaint_id='"+request.getParameter("delid")+"'";
                       out.print(str1);
                     ResultSet rs3 = con.selectCommand(str1);
                     int i = 0;
                    while (rs3.next()) 
                    { 
                        i++;

                %>
                <tr>
                    <td><%=i%></td>
                    <td>
                        <img src="../Assets/Files/UserGallery/<%=rs3.getString("usercg_image")%>" width="120" height="120">
                    </td><br>
                <td>
                    <%=rs3.getString("usercg_caption")%>
                </td>
                
                   <%
                   
                    }
                %>
                           
              </table>
    </body>
</html>
