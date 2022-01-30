<%-- 
    Document   : ComplaintDept
    Created on : 15 Oct, 2021, 3:43:54 PM
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
                    <th>Subject</th>
                    <th>Remarks</th>
                    <th>Send Date</th>
                     <th>Action</th>
                    
                     
                </tr>
                <%
                    String str1 = "select * from  tbl_forwardmainadmin dis inner join tbl_usercomplaint uc on dis.usercomplaint_id=uc.usercomplaint_id where dis.fmainadmin_vstatus='0' ";
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
                    
                    <td><%=rs3.getString("fmainadmin_title")%></td>
                    <td><%=rs3.getString("fmainadmin_sub")%></td>
                    <td><%=rs3.getString("fmainadmin_remarks")%></td>
                    <td><%=rs3.getString("fmainadmin_senddate")%></td>
                    <td><a href="GalleryDept.jsp?delid=<%=rs3.getString("usercomplaint_id")%>">Media</a></td>
                    <td><a href="ViewComplaintDetail.jsp?complaintid=<%=rs3.getString("usercomplaint_id")%>">View More</a></td>
                </tr>
                <%
                    }
                %>
                             </table>
    </body>
</html>
