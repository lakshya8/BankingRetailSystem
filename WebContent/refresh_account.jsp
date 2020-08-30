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
               String idd= (String)request.getParameter("id");
               //out.println(idd);
                Connection conn= MyConnection.getConnection();
                String sql="SELECT * from AccountStatus where Account_Id="+idd;
                PreparedStatement st=conn.prepareStatement(sql);
                ResultSet rs = st.executeQuery();
                 rs.next();
                 String str= rs.getString("Message");
                String a="";
                
                 if(str.equalsIgnoreCase("Account creation initiated successfully"))  
                       {
                	  a="Account created successfully";
                       }
                 else if(str.equalsIgnoreCase("Account deletion initiated successfully"))  
                 {
                	  a="Account deleted successfully";
                 }
                 else if(str.equalsIgnoreCase("Account updation initiated successfully"))  
                 {
                	  a="Account updated successfully";
                 }
                 else if(str.equalsIgnoreCase("Customer has account of specified type"))  
                 {
                	  a="Customer already has account of specified type";
                 }
           
           
                	 
                    //UPDATE 
                

              
                     if(a!="")
                     {
                     String sql1="Update AccountStatus set Message=? where Account_Id="+idd; 
                     PreparedStatement pst= conn.prepareStatement(sql1);
                     pst.setString(1,a);
                     //pst.setInt(2, idd);
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
                     
                 
                     String sql2="SELECT * from AccountStatus where Account_Id="+idd;
                     pst=conn.prepareStatement(sql2);
                    // pst.setInt(1,idd);
                     ResultSet ss = pst.executeQuery();
                      ss.next();
                      String ms= ss.getString("Message");
                     out.println(ms);
            //request.getRequestDispatcher("view_account.jsp").forward(request,response);
                     
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