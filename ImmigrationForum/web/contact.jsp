<%@page contentType="text/html" pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Administrator Contact</title>
        <link rel="stylesheet" type="text/css" href="style/main1.css"/>
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
                        <td colspan="3"><textarea class="formElement" rows="11" cols="50" name="biography"></textarea></td>
                        <td rowspan="3">
                            </tr>
                    </table><br/>
                    <input class="button" type="submit" value="Submit"/>
                    <input class="button" type="submit" value="Reset"/>

                </form>
                <br/>

            </div></center>
        <div id="footer">
            Immigration Forum - Contact the Administrator.
        </div>
    </body>
</html>
