<%@page contentType="text/html" pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Immigration Forum &raquo; Edit Profile</title>
        <link rel="stylesheet" type="text/css" href="style/main.css"/>
    </head>
    <body>
        <div id="hd">
            <a href="eindex?action=timeline.jsp"><img class="logo" src="images/immigrationLogo.jpg" alt="logo"/></a>
        </div>
        <div id="bd">
            <h1>Profile for ${user.username}</h1>
            <h2 class="flash">${flash}</h2>
            <form method="POST" action="eindex"/>
            <input type="hidden" name="action" value="pedit"/>
            <input type="hidden" name="username" value="${user.username}"/>
            <table>
                <tr>
                    <td><label class="formElement areaLabel">Biography</label></td>
                    <td colspan="3"><textarea class="formElement" rows="11" cols="50" name="biography">${user.profile.biography}</textarea></td>
                    <td rowspan="3">
                        <a href="eindex?action=upload">
                            <c:choose>
                                <c:when test="${user.profile.picture != null}">
                                    <img src="eindex?action=image&for=${user.username}"/>
                                </c:when>
                                <c:otherwise>
                                    <img src="images/default.jpg"/>
                                </c:otherwise>
                            </c:choose>
                        </a>
                    </td>
                </tr>
                <tr>
                    <td><label class="formElement">Email Address</label></td>
                    <td><input class="formElement" type="email" name="email" value="${user.profile.email}"/></td>
                </tr>
                <tr>
                    <td colspan="4"><input type="submit" value="Save changes"/></td>
                </tr>
            </table>
        </form>
       
        <a class="nav" href="eindex?action=timeline">Back to Home.</a>    
    </div><br/>
    
    <div id="ft">
        Immigration Forum - Edit the Profile.
    </div>
</body>
</html>
