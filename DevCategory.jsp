<%-- 
    Document   : DevCategory
    Created on : 1 Oct, 2021, 3:18:16 PM
    Author     : DREAM HOME
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Development Category</title>
    </head>
    <body>
        <form method="post" name="form1">
            <table border="1"  cellpadding="10" style="border-collapse:collapse;" align="center">
                <tr>
                    <td>Development Category</td>
                    <td><input type="text" name="txtCate" required="required"  id="txtCate">
                       
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnSave" id="btnSave" value="Save">
                        <input type="reset" name="btnCancel" id="btnCancel" value="Cancel"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
