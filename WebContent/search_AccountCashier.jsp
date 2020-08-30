<%
response.setContentType("text/html");
String s=request.getParameter("action");
out.println("Hello");
if(s.equals("customer"))
{
	out.println("hello");
	request.getRequestDispatcher("searchCustIdAccountCashier.jsp").forward(request,response);
}
else
{
	request.getRequestDispatcher("searchAccountIdCashier.jsp").forward(request,response);
}
%>