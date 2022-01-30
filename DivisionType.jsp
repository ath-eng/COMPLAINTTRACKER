<%-- 
    Document   : DivitionType
    Created on : Sep 26, 2021, 2:44:07 PM
    Author     : PSST
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Division</title>
    </head>
    <body>
        <%
            if(request.getParameter("btn_save")!=null)
            {
                String ins="insert into tbl_division(district_id,division_name)values('"+request.getParameter("slctDistrict")+"','"+request.getParameter("txt_division")+"')";
                    con.executeCommand(ins);
                    response.sendRedirect("DivisionType.jsp");
            }
             if(request.getParameter("delid")!=null)
            {
                String str2="delete from tbl_division where division_id='"+request.getParameter("delid")+"'";
                con.executeCommand(str2);
            }
            
        %>
        <form method="post" name="frm">
              <table border="1" cellpadding="10" style="border-collapse:collapse;" align="center">
                  <tr>
                      <td>District</td>
                      <td>
                          <select name="slctDistrict"> 
                              <option>---Select---</option>
                             <%
                                 String sel="select * from tbl_district";
                                 ResultSet rs=con.selectCommand(sel);
                                 while(rs.next())
                                 {
                                     %>
                                     <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                                     <%
                                 }
                             
                             %>
                          </select>
                      </td>
                  </tr>
                  <tr>
                      <td>Division</td>
                      <td><input type="text" name="txt_division" id="txt_division"></td>
                  </tr>
                  <tr>
                       <td colspan="2" align="center"><input type="submit" name="btn_save" id="btn_save" value="save">
                          <input type="reset" name="btn_cancel" id="btn_cancel" value="cancel"></td>
                  </tr> 
            </table>
                          <hr>
                          <br>
                          <table border="1" align="center">
                              <tr>
                                  <th>SI No:</th>
                                  <th>District</th>
                                  <th>Division</th>
                                  <th>Action</th>
                                  
                              </tr>
                              <%
                                 int i = 0;
                                 String sel1 = "select * from tbl_division p inner join tbl_district d on p.district_id=d.district_id";
                                 ResultSet rs1 = con.selectCommand(sel1);
                                 while(rs1.next())
                                 {
                                     i++;
                                     %>
                                     <tr>
                                         <td><%=i%></td>
                                         <td><%=rs1.getString("district_name")%></td>
                                         <td><%=rs1.getString("division_name")%></td>
                                         <td><a href="DivisionType.jsp?delid=<%=rs1.getString("division_id")%>">Delete</a></td>
                                     </tr>
                                     
                                     <%
                                 }
                                 %>
                          </table>
        </form>
        </body>
</html>
