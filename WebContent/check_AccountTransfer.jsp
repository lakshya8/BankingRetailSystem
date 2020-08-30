<%@page import="bean.AccountBean"%>
<%@page import="java.util.ArrayList"%>
<%ArrayList<AccountBean> a=(ArrayList<AccountBean>)session.getAttribute("account");
int i=Integer.parseInt(request.getParameter("ac1"));
int j=Integer.parseInt(request.getParameter("ac2"));
response.setContentType("text/html");
String action=(String)session.getAttribute("action");
out.println(action);
if(a.get(i).getStatus().equals("Inactive") || a.get(j).getStatus().equals("Inactive"))
{
	request.setAttribute("msg", "Wrong Account Number");
	request.getRequestDispatcher("transfer_view.jsp").forward(request,response);
}
else
{
	session.setAttribute("oneaccount",a.get(i));
	session.setAttribute("twoaccount",a.get(j));
		request.getRequestDispatcher("cashier_Transfer.jsp").forward(request,response);

}
%>