<%
response.setContentType("text/html");
String s=request.getParameter("action");
out.println("Hello");
if(s.equals("customer"))
{
	out.println("hello");
	request.getRequestDispatcher("searchCustIdAccount.jsp").forward(request,response);
}
else
{
	request.getRequestDispatcher("searchAccountId.jsp").forward(request,response);
}
%>