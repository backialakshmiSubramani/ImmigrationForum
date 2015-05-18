<%-- 
    Document   : contact
    Created on : May 8, 2015, 1:05:27 AM
    Author     : bhagya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator Contact</title>
    </head>
    <body>

        <div id="hd">
            <a href="eindex?action=timeline.jsp"><img src="images/immigrationLogo.jpg" alt="logo"/></a>
        </div>
        <center>
            <div id="bd">
                <h1>Contact Us</h1>
                <h2 class="flash">${flash}</h2>
                <form method="POST" action="eindex">
                    <input type="hidden" name="action" value="submit"/>
                    <table>
                        <tr>
                        <td><label class="formElement" for="username">User Name :</label></td>
                        <td><input class="formElement" type="text" name="username" required/><br/></td>
                        </tr>
                        <tr>
                        <td><label class="formElement" for="email">What is your Email :</label></td>
                        <td><input class="formElement" type="email" name="email" required/><br/><br/></td>
                        </tr>
                        <tr>
                        <td><label class="formElement areaLabel">Write your Detailed Message :</label></td>
                        <td colspan="3"><textarea class="formElement" rows="12" cols="50" name="biography"></textarea></td>
                        <td rowspan="3">
                            </tr>
                    </table><br/><br/>
                    <input class="button" type="submit" value="Submit"/>
                    <input class="button" type="submit" value="Reset"/>

                </form>
                <br/><br/>

            </div></center>
        <div id="footer">
            Immigration Forum - Contact the Administrator.
        </div>
    </body>
</html>
