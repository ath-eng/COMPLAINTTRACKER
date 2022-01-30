<%-- 
    Document   : ProblemSolved
    Created on : 24 Oct, 2021, 2:10:07 PM
    Author     : DREAM HOME
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
     
           
            session.setAttribute("complaintid", request.getParameter("complaintid"));
           
       %>
            
    <body>
        <form method="post" name="frm"  enctype="multipart/form-data" action="../Assets/ActionPages/MainFinalReport.jsp">
            <table border="1" cellpadding="10" style="border-collapse:collapse;" align="center">
                <tr>
                    <td>Final Report</td>
                    <td><input type="file" name="filefinalreport" id="txtRprt">
                    </td>
                </tr>
                <tr>
                    <td>Remark</td>
                    <td><textarea name="remark" cols="50" rows="5"></textarea> </td>
                </tr>
                <tr>
                    <td>Expense</td>
                    <td><input type="text" name="txtExp" id="txtExp"></td>
                </tr>
                 <tr>
                    <td>Expense Bill</td>
                    <td><input type="file" name="fileExpenseBill" id="txtExpbil"></td>
                </tr>
                 <tr>
                    
                    <td colspan="2" align="center"><input type="submit" name="sub" id="sub" value="Send"></td>
                </tr>
            </table>
       </form>
    </body>
</html>
