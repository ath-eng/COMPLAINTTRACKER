<%-- 
    Document   : DeptComplaint
    Created on : 1 Oct, 2021, 2:44:33 PM
    Author     : DREAM HOME
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Department Complaint</title>
    </head>
    <body>
          <%
            if(request.getParameter("sub")!=null)
            {
                String ins="insert into tbl_deptcomplaint(department_id,deptcomplaint_name)values('"+request.getParameter("depSlct")+"','"+request.getParameter("txtComp")+"')";
                    con.executeCommand(ins);
            }
             if(request.getParameter("delid")!=null)
            {
                String str2="delete from tbl_deptcomplaint where deptcomplaint_id='"+request.getParameter("delid")+"'";
                con.executeCommand(str2);
            }
            
        %>
        <form method="post" name="frm1" >
            <table border="1" cellpadding="10" style="border-collapse:collapse;" align="center">
                <tr>
                    <td>Department</td>
                            <td><select name="depSlct">
                                    <option>---select---</option>
                                    <%
                                 String sel="select * from tbl_department";
                                 ResultSet rs=con.selectCommand(sel);
                                 while(rs.next())
                                 {
                                     %>
                                     <option value="<%=rs.getString("department_id")%>"><%=rs.getString("department_name")%></option>
                                     <%
                                 }
                             
                             %>
                        </select></td>
                </tr>
                <tr>
                    <td>Complaint</td>
                    <td><input type="text" name="txtComp" id="txtComp"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" id="sub" name="sub" value="save">
                        <input type="reset" id="sub" name="sub" value="cancel">
                    </td>
                </tr>
            </table>
            <hr>
                          <br>
                          <table border="1" align="center">
                              <tr>
                                  <th>SI No</th>
                                  <th>Department</th>
                                  <th>Complaint</th>
                                  <th>Action</th>
                                  
                              </tr>
                              <%
                                 int i = 0;
                                 String sel1 = "select * from tbl_deptcomplaint p inner join tbl_department d on p.department_id=d.department_id";
                                 ResultSet rs1 = con.selectCommand(sel1);
                                 while(rs1.next())
                                 {
                                     i++;
                                     %>
                                     <tr>
                                         <td><%=i%></td>
                                         <td><%=rs1.getString("department_name")%></td>
                                         <td><%=rs1.getString("deptcomplaint_name")%></td>
                                         <td><a href="DeptComplaint.jsp?delid=<%=rs1.getString("deptcomplaint_id")%>">Delete</a></td>
                                     </tr>
                                     
                                     <%
                                 }
                                 %>
                          </table>
        </form>
    </body>
</html>
