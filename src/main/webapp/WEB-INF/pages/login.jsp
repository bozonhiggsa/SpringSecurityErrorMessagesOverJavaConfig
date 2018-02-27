<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
    <title>My Login page</title>
    <fmt:setBundle basename="messages" />
    <fmt:message key="message.password" var="noPass" />
    <fmt:message key="message.username" var="noUser" />
    <fmt:message key="message.usernamePassword" var="noUserPassword" />
    <link href=<c:url value="${pageContext.servletContext.contextPath}/static/style.css"/> rel="stylesheet">
    <script type="text/javascript">
        function validate() {
            if (document.f.username.value == "" && document.f.password.value == "") {
                alert("${noUserPassword}");
                document.f.username.focus();
                return false;
            }
            if (document.f.username.value == "") {
                alert("${noUser}");
                document.f.username.focus();
                return false;
            }
            if (document.f.password.value == "") {
                alert("${noPass}");
                document.f.password.focus();
                return false;
            }
        }
    </script>
</head>
<body>
<c:url value="${pageContext.servletContext.contextPath}/login" var="loginUrl"/>
<form name="f" action="${loginUrl}" method="post" onsubmit="return validate();">
    <c:if test="${param.error != null}">
        <div>
            <h4>
                <spring:message code="message.badCredentials">
                </spring:message>
            </h4>
        </div>
    </c:if>
    <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION} and ${param.error == null}">
        <div>
            <h4>
                <spring:message code="message.logoutError">
                </spring:message>
            </h4>
        </div>
    </c:if>
    <c:if test="${param.logout == true}">
        <div>
            <h4>
                <spring:message code="message.logoutSucc">
                </spring:message>
            </h4>
        </div>
    </c:if>
    <p>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username"/>
    </p>
    <p>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password"/>
    </p>
    <p>
        <label for="remember-me">Remember Me</label>
    </p>
    <input type="checkbox" id="remember-me" name="remember-me"/>

    <input type="hidden"
           name="${_csrf.parameterName}"
           value="${_csrf.token}"/>
    <button type="submit">Sign In</button>
</form>

<a href="?lang=en">English</a> |
<a href="?lang=ru_RU">Russian</a>

</body>
</html>