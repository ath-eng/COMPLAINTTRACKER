<%-- 
    Document   : SolvedComplaints
    Created on : 24 Oct, 2021, 1:29:11 PM
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
                    <th>District</th>
                    <th>Division</th>
                    <th>Department</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Send Date</th>
                    <th>Is public</th>
                     <th>Action</th>
                    
                     
                </tr>
                <%
                    String str1 = "select * from tbl_usercomplaint uc inner join tbl_division divi on uc.division_id=divi.division_id " 
                            + "inner join tbl_divisionadmin da on divi.division_id=da.division_id where  usercomplaint_mainadminstatus=2";
                            
                    ResultSet rs3 = con.selectCommand(str1);
                System.out.println(str1);
                    int i = 0;
                    while (rs3.next()) 
                    { 
                        i++;

                %>
                <tr>
                    <td><%=i%></td>
                 
                    <td><%=rs3.getString("division_name")%></td>
                 
                    <td><%=rs3.getString("usercomplaint_title")%></td>
                    <td><%=rs3.getString("usercomplaint_description")%></td>
                    <td><%=rs3.getString("usercomplaint_senddate")%></td>
                    <td><%=rs3.getString("usercomplaint_ispublic")%></td>
                    <td>Download Final Report</td>
                    
                </tr>
                <%
                    }
                %>
                             </table>
    </body>
</html>
