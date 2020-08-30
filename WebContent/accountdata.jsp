<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conn.MyConnection"%>
<%@page import="java.sql.Connection"%>
<%
	try{
		response.setContentType("text/html");
		String id = request.getParameter("customer_id");
		//out.println(id);
		String accType = request.getParameter("account_type");
		int amount = Integer.parseInt(request.getParameter("deposit_amount"));
		
		//out.println(id+" "+name+" "+age+" "+address+" "+state+" "+city+" ");
		
		String status = "Active";
		//out.println(id);
		//out.println(status);
		Connection conn=MyConnection.getConnection();
		//Statement st = null;
		String qry = "select * from CustomerStatus where Customer_Id="+id+" and Status='"+status+"'";
		//out.println(qry);
		PreparedStatement pst=conn.prepareStatement(qry);
		ResultSet rs = pst.executeQuery(qry);
		if(rs.next())
		{	
			String s="insert into AccountStatus values("+id+",Account_Id_Seq.nextval,?,?,'Active','Account creation initiated successfully',sysdate)";
			
			pst=conn.prepareStatement(s);
		
		pst.setString(1,accType);
		pst.setInt(2,amount);
	
		ResultSet i=pst.executeQuery();
		out.println(i);
		s="select * from AccountStatus where Customer_Id="+id+" Order By Last_Updated Desc";
		pst=conn.prepareStatement(s);
		ResultSet rt=pst.executeQuery();
		rt.next();
			if(i!=null)
			{	
				request.setAttribute("msg","Account creation initiated successfully:"+rt.getString("Account_Id"));
				request.getRequestDispatcher("createAccount.jsp").forward(request,response);
			}
		}
		else
		{
			request.setAttribute("msg","Account creation failed: Customer id Doesn't exist");
			request.getRequestDispatcher("createAccount.jsp").forward(request,response);
			//out.print("<font size=3  color=red>"+id+" does Not Exist !!</font>");
		}
	}		
	catch(Exception e)
	{
		out.println(e);
	} %>