<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%
UserService userService = UserServiceFactory.getUserService();
User user = userService.getCurrentUser();
String loginUrl = userService.createLoginURL(request.getRequestURI());
String logoutUrl = userService.createLogoutURL(request.getRequestURI());
%>
<html>
	<head>
		<title>Java Auth Test</title>
	</head>
	<body>
		<h1>Java Auth Test</h1>
		<h2>URLs</h2>
		<ul>
			<li>Login: <a href="<%= loginUrl %>"><%= loginUrl %></a>
			<li>Logout: <a href="<%= logoutUrl %>"><%= logoutUrl %></a>
		</ul>
		<h2>User</h2>
<% if( user == null ) { %>
		<i>Not logged in.</i>
<% } else { %>
		Logged in.
		<ul>
			<li>User ID: <%= user.getUserId() %>
			<li>Nickname: <%= user.getNickname() %>
			<li>Email: <%= user.getEmail() %>
			<li>Administrator: <%= userService.isUserAdmin() ? "true" : "false" %>
		</ul>
<% } %>
	</body>
</html>
