<%@page import="bean.AccountBean"%>
<%@page import="java.util.ArrayList"%>
<% 
int i=Integer.parseInt(request.getParameter("id"));
ArrayList<AccountBean> a=(ArrayList<AccountBean>)session.getAttribute("account");
response.setContentType("text/html");
out.println("<table border='1' align='center' ><tr style='background-color:yellow'><td>Customer Id</td><td>Account Id</td><td>Balance</td><td>Account Type</td><td>Status</td></tr><tr><td>"+a.get(i).getCustomer_Id()+"</td><td>"+a.get(i).getAccount_id()+"</td><td>"+a.get(i).getDeposit()+"</td><td>"+a.get(i).getAccount_type()+"</td><td>"+a.get(i).getStatus()+"</td></tr></table>");
%>