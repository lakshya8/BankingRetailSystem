<%
response.setContentType("text/html");
String s=request.getParameter("action");
if(s.equals("customer"))
{
	request.getRequestDispatcher("searchCustId.jsp").forward(request,response);
}
else
{
	request.getRequestDispatcher("searchSsnId.jsp").forward(request,response);
}
%>