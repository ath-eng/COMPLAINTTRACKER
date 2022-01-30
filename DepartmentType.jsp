<%-- 
    Document   : DepratmentType
    Created on : Sep 26, 2021, 2:20:26 PM
    Author     : PSST
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Department</title>
    </head>
    <body>
        <%
            String editId = "", editName = "";
            if (request.getParameter("btnSave") != null) {
                if (request.getParameter("txtId").equals("")) {
                    String ins = "insert into tbl_department(department_name)values('" + request.getParameter("txtDepartment") + "')";
                    con.executeCommand(ins);
                    response.sendRedirect("DepartmentType.jsp");
                } else {
                    String up = "update  tbl_department set department_name='" + request.getParameter("txtDepartment") + "' where department_id='" + request.getParameter("txtId") + "'";
                    con.executeCommand(up);
                    response.sendRedirect("DepartmentType.jsp");
                }
            }
            if (request.getParameter("delid") != null) {
                String str2 = "delete from tbl_department where department_id='" + request.getParameter("delid") + "'";
                con.executeCommand(str2);
                response.sendRedirect("DepartmentType.jsp");
            }
            if (request.getParameter("edid") != null) {
                String sell = "select * from tbl_department where department_id='" + request.getParameter("edid") + "'";
                ResultSet rsl = con.selectCommand(sell);
                if (rsl.next()) {
                    editId = rsl.getString("department_id");
                    editName = rsl.getString("department_name");
                }
            }
        %>
        <form method="post" name="form1">
            <table border="1"  cellpadding="10" style="border-collapse:collapse;" align="center">
                <tr>
                    <td>Department</td>
                    <td><input type="text" name="txtDepartment" required="required" value="<%=editName%>" id="txtDepartment">
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
                    String str1 = "select * from tbl_department";
                    ResultSet rs = con.selectCommand(str1);
                    int i = 0;
                    while (rs.next()) {
                        i++;

                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("department_name")%></td>
                    <td>
                        <a href="DepartmentType.jsp?delid=<%=rs.getString("department_id")%>">Delete</a>
                        <a href="DepartmentType.jsp?edid=<%=rs.getString("department_id")%>">Edit</a>

                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>


