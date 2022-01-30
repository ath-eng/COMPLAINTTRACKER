<%-- 
    Document   : DistrictHead
    Created on : Sep 26, 2021, 2:25:40 PM
    Author     : PSST
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>District Admin</title>
    </head>
    <body>
        
        <form method="post" name="frm" enctype="multipart/form-data" action="../Assets/ActionPages/DistrictUploadAction.jsp">
        <table border="1" cellpadding="10" style="border-collapse:collapse;" align="center">
            <tr>
                <td>Name</td>
                <td><input type="text" name="txt_name" id="txt_name" pattern="[A-Za-z ]{1,32}" required></td>
            </tr> 
            <tr>
                <td>Contact</td>
                <td><input type="text" name="txt_contact" id="txt_contact" pattern="[0-9]{10,10}" required></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="email" name="txt_email" id="txt_email" required></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td><input type="radio" name="rdbGender" id="rdbGender" value="Male" required>Male
                <input type="radio" name="rdbGender" id="rdbGender" value="Female">Female</td>
            </tr>
            <tr>
                <td>Photo</td>
                <td><input type="file" name="fPhoto" id="fPhoto"></td>
            </tr>
            <tr>
                <td>District</td>
                <td>
                          <select name="slctdist" required> 
                              <option value="">---select---</option>
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
                <td>Username</td>
                <td><input type="text" name="txt_usr" id="txt_usr" required></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="txt_pass" id="txt_pass" required></td>
            </tr>
            <tr>
                <td>Repassword</td>
                <td><input type="password" name="txt_re" id="txt_re" required></td>
            </tr>
            <tr>
                      <td colspan="2" align="center"><input type="submit" name="btn_save" id="btn_save" value="save">
                          <input type="reset" name="btn_cancel" id="btn_cancel" value="cancel"></td>
                  </tr>
        </table> 
    </form>
    </body>
</html>
