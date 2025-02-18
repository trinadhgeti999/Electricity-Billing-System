package Info;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class billCalculator extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 response.setContentType("text/html");
	     PrintWriter out = response.getWriter();
	        
		String serviceNumber=request.getParameter("servicenumber");
		int units=Integer.parseInt(request.getParameter("units"));
		double billAmount=0;
		
		//
		String dbusername="root";
		String dbpassword="@Mysql";
		String dbschema="ebill";
		String url="jdbc:mysql://localhost:3306/ebill";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,dbusername,dbpassword);
			String selectquery="select * from userinfo where serviceNumber=?;";
			PreparedStatement pre=con.prepareStatement(selectquery);
			
			pre.setString(1, serviceNumber);
			ResultSet rs=pre.executeQuery();
			
			if(rs.next()) {
				   if (units <= 100) {
			            billAmount = units * 3;
			        } else if (units <= 300) {
			            billAmount = (100 * 3) + ((units - 100) * 5);
			        } else {
			            billAmount = (100 * 3) + (200 * 5) + ((units - 300) * 7);
			        }
				   
				   double fixedCharge = 50;  
			       double electricityDuty = billAmount * 0.05; 
			       double gst = (billAmount + electricityDuty) * 0.18;
			       String formattedGst = String.format("%.2f", gst);

			       String name=rs.getString(1);
			       String phoneno=rs.getString(2);
			       String address=rs.getString(5);
			       
			       
			       double totalBill = billAmount + fixedCharge + electricityDuty + gst;
			       response.sendRedirect("billPage.jsp?serviceNumber="+serviceNumber+"&billAmount="+ billAmount+"&fixedCharge="+fixedCharge+ "&electricityDuty=" + electricityDuty+ "&gst=" + formattedGst+ "&totalBill=" + totalBill+"&Name="+name+"&phoneno="+phoneno+"&address="+address);
			       
			}else {
				System.out.println("Service Number not valid");
				response.sendRedirect("dashboard.jsp?message=service number not valid");
			}
			
		} catch (ClassNotFoundException e) {
			response.getWriter().println("Database Driver Error: " + e.getMessage());
			e.printStackTrace();
		}catch(SQLException e) {
			response.getWriter().println("Database Connection Error: " + e.getMessage());
			e.printStackTrace();
			
		}
		
		
	}

}
