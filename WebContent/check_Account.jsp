<%@page import="bean.AccountBean"%>
<%@page import="java.util.ArrayList"%>
<%ArrayList<AccountBean> a=(ArrayList<AccountBean>)session.getAttribute("account");
int i=Integer.parseInt(request.getParameter("ac"));
response.setContentType("text/html");
String action=(String)session.getAttribute("action");
out.println(action);
if(a.get(i).getStatus().equals("Inactive"))
{
	request.setAttribute("msg", "Wrong Account Number");
	request.getRequestDispatcher("test.jsp").forward(request,response);
}
else
{
	session.setAttribute("oneaccount",a.get(i));
	if(action.equals("deposit"))
	{
		request.getRequestDispatcher("cashier_Deposit.jsp").forward(request,response);
	}
	else if(action.equals("withdrawl"))
	{
		request.getRequestDispatcher("cashier_Withdrawl.jsp").forward(request,response);
	}
	else if(action.equals("transfer"))
	{
		request.getRequestDispatcher("cashier_Transfer.jsp").forward(request,response);
	}
}
%>