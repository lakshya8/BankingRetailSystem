<%@page import=" java.io.PrintWriter" %>
<%@page import=" java.sql.ResultSet" %>
<%@page import=" java.sql.Statement" %>
<%@page import=" java.sql.PreparedStatement" %>
<%@page import=" java.sql.Connection" %>
<%@page import="Conn.MyConnection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
  response.setContentType("text/html");
           
           try{
               int idd= Integer.parseInt((String)request.getParameter("id"));
               //out.println(idd);
                Connection conn= MyConnection.getConnection();
                String sql="SELECT * from CustomerStatus where Customer_Id=?";
                PreparedStatement st=conn.prepareStatement(sql);
                st.setInt(1, idd);
                ResultSet rs = st.executeQuery();
                 rs.next();
                 String str= rs.getString("Message");
                String a="";
                
                 if(str.equals("Customer creation initiated successfully"))  
                       {
                	  a="Customer created successfully";
                       }
                 else if(str.equals("Customer update initiated successfully"))  
                 {
                	  a="Customer updated successfully";
                 }
                 else if(str.equals("Customer deletion initiated successfully"))  
                 {
                	  a="Customer deleted successfully";
                 }
           
           
                	 
                    //UPDATE 
                

              
                     if(a!="")
                     {
                     String sql1="Update CustomerStatus set Message=? where Customer_Id=?"; 
                     PreparedStatement pst= conn.prepareStatement(sql1);
                     pst.setString(1,a);
                     pst.setInt(2, idd);
                     int i=pst.executeUpdate();
                   //  if(i>0)
                     //{
                    	 
                    	// out.println("Success");
                    // }
                     //else
                     //{
                    	// out.println("No");
                     //}
               
                     
                     
                     //SELECT
                     
                 
                     String sql2="SELECT * from CustomerStatus where Customer_Id=?";
                     pst=conn.prepareStatement(sql2);
                     pst.setInt(1,idd);
                     ResultSet ss = pst.executeQuery();
                      ss.next();
                      String ms= ss.getString("Message");
                     out.println(ms);
            //request.getRequestDispatcher("view_customer.jsp").forward(request,response);
                     
                     }
                     else
                     {
                    	 out.println(str);
                     }
            
    
           }
           catch(Exception e)
           {
               out.println(e.getMessage());
           }
   
            
            %>