<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Cookie[] cks = request.getCookies();
	if (cks != null) {
		for (int i = 0; i < cks.length; i++) {
			String name = cks[i].getName();
			String value = cks[i].getValue();
			if (name.equals("authadmin")) {
		break; // exit the loop and continue the page
			}
			if (i == (cks.length - 1)) // if all cookie are not valid redirect to error page
			{
		response.sendRedirect("/WebFastFood/admin/login.htm");
		return; // to stop further execution
			}
		}
	} else {
		response.sendRedirect("/WebFastFood/admin/login.htm");
		return; // to stop further execution
	}
%>