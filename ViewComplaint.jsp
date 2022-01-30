<%-- 
    Document   : ViewComplaint
    Created on : 23 Oct, 2021, 12:42:45 PM
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
                    String str1 = "select * from tbl_usercomplaint uc inner join tbl_deptcomplaint dco on dco.deptcomplaint_id=uc.deptcomplaint_id "
                            + "inner join tbl_division dive on uc.division_id=dive.division_id "
                            + "inner join tbl_deptcomplaint depcom on uc.deptcomplaint_id =depcom.deptcomplaint_id "
                            + "inner join tbl_district dis on dive.district_id=dis.district_id inner join tbl_department de on de.department_id=depcom.department_id where dis.district_id='"+session.getAttribute("dist_id")+"'";
                    ResultSet rs3 = con.selectCommand(str1);
                System.out.println(str1);
                    int i = 0;
                    while (rs3.next()) 
                    { 
                        i++;

                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs3.getString("district_name")%></td>
                    <td><%=rs3.getString("division_name")%></td>
                    <td><%=rs3.getString("department_name")%></td>
                    <td><%=rs3.getString("usercomplaint_title")%></td>
                    <td><%=rs3.getString("usercomplaint_description")%></td>
                    <td><%=rs3.getString("usercomplaint_senddate")%></td>
                    <td><%=rs3.getString("usercomplaint_ispublic")%></td>
                    <td><a href="ViewGallery.jsp?delid=<%=rs3.getString("usercomplaint_id")%>">View More</a></td>
                </tr>
                <%
                    }
                %>
                             </table>
    </body>
</html>