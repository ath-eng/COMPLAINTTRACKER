<%-- 
    Document   : District
    Created on : Sep 26, 2021, 2:22:56 PM
    Author     : PSST
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>District</title>
    </head>
    <body>
        <%
            String editId = "", editName = "";
            if (request.getParameter("btnSave") != null) {
                if (request.getParameter("txtId").equals("")) {
                    String ins = "insert into tbl_district(district_name)values('" + request.getParameter("txtDistrict") + "')";
                    con.executeCommand(ins);
                    response.sendRedirect("District.jsp");
                } else {
                    String up = "update  tbl_district set district_name='" + request.getParameter("txtDistrict") + "' where district_id='" + request.getParameter("txtId") + "'";
                    con.executeCommand(up);
                    response.sendRedirect("District.jsp");
                }
            }
            if (request.getParameter("delid") != null) {
                String str2 = "delete from tbl_district where district_id='" + request.getParameter("delid") + "'";
                con.executeCommand(str2);
                response.sendRedirect("District.jsp");
            }
            if (request.getParameter("edid") != null) {
                String sell = "select * from tbl_district where district_id='" + request.getParameter("edid") + "'";
                ResultSet rsl = con.selectCommand(sell);
                if (rsl.next()) {
                    editId = rsl.getString("district_id");
                    editName = rsl.getString("district_name");
                }
            }
        %>
        <form method="post" name="form1">
            <table border="1"  cellpadding="10" style="border-collapse:collapse;" align="center">
                <tr>
                    <td>District</td>
                    <td><input type="text" name="txtDistrict" required="required" value="<%=editName%>" id="txtDistrict">
                        <input type="hidden" name="txtId"  value="<%=editId%>" id="txtId">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnSave" id="btnSave" value="Save">
                        <input type="reset" name="btnCancel" id="btnCancel" value="Cancel"></td>
                </tr>
            </table>
            <hr>
            <br>
            <table border="1" align="center" cellpadding="10">
                <tr>
                    <th>Sl.no</th>
                    <th>Department</th>
                    <th>Action</th>
                </tr>
                <%
                    String str1 = "select * from tbl_district";
                    ResultSet rs = con.selectCommand(str1);
                    int i = 0;
                    while (rs.next()) {
                        i++;

                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("district_name")%></td>
                    <td>
                        <a href="District.jsp?delid=<%=rs.getString("district_id")%>">Delete</a>
                        <a href="District.jsp?edid=<%=rs.getString("district_id")%>">Edit</a>

                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>

