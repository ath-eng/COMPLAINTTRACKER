<%-- 
    Document   : Complaint
    Created on : 15 Oct, 2021, 1:09:45 PM
    Author     : DREAM HOME
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint</title>
    </head>
    <body>
        <table border="1" align="center" cellpadding="10" style="border-collapse:collapse;">
                <tr>
                    <th>Sl.no</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Photo</th>
                    <th>Send Date</th>
                    <th>User Name</th>
                    <th>User Contact</th>
                    <th>User Address</th> 
                    <th>User Photo</th>
                    <th>Action</th>
                    
                     
                </tr>
                <%
                    String str1 ="select * from tbl_usercomplaint uc inner join tbl_division divi on uc.division_id=divi.division_id "
                             + "inner join tbl_user us on uc.user_id=us.user_id where usercomplaint_id='"+request.getParameter("complaintid")+"' ";
                          out.print(str1);
                    ResultSet rs3 = con.selectCommand(str1);
                System.out.println(str1);
                    int i = 0;
                    while (rs3.next()) 
                    { 
                        i++;

                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs3.getString("usercomplaint_title")%></td>
                    <td><%=rs3.getString("usercomplaint_description")%></td>
                     <td><img src="../Assets/Files/ComplaintPhoto/<%=rs3.getString("usercomplaint_photo")%>" width="120" height="120"></td>
                    <td><%=rs3.getString("usercomplaint_senddate")%></td>
                    <td><%=rs3.getString("user_name")%></td>
                    <td><%=rs3.getString("user_contact")%></td>
                    <td><%=rs3.getString("user_address")%></td>
                   <td><img src="../Assets/Files/UserPhoto/<%=rs3.getString("user_photo")%>" width="120" height="120"></td>
                    
                   <td><a href="ProblemSolved.jsp?complaintid=<%=rs3.getString("usercomplaint_id")%>">Problem Solved</a></td>
                    
                </tr>
                <%
                    }
                %>
                             </table>
    </body>
</html>
