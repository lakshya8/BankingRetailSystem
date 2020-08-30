<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="Conn.MyConnection" %>
<%@page import="bean.AccountBean" %>

<% 
try
{
	response.setContentType("text/html");
	//AccountBean account=(AccountBean)request.getAttribute("account");
	String id=request.getParameter("ac");
	Connection conn=MyConnection.getConnection();
	String s="select * from AccountStatus where Account_id="+id;
	PreparedStatement pst=conn.prepareStatement(s);
	ResultSet rs=pst.executeQuery();
	rs.next();
	if(rs.getString("Status").equals("Inactive"))
	{
		request.setAttribute("msg","Account Already Deleted");
		request.getRequestDispatcher("deleteAccount.jsp").forward(request,response);
	}
	s="update AccountStatus set Status='Inactive' ,Message='Account deletion initiated successfully', Last_Updated=sysdate where Account_Id="+id;
	pst=conn.prepareStatement(s);
	int i=pst.executeUpdate();
    if(i==0)
    {
    	request.setAttribute("msg","Account Deletion Intitiation failed");
    	request.getRequestDispatcher("deleteAccount.jsp").forward(request,response);
    }
    else
    {request.setAttribute("msg","Account Deletion Intitiation Successfull");
	request.getRequestDispatcher("deleteAccount.jsp").forward(request,response);
    	
    }

}
catch(Exception e)
{
	
}


%> 
