package Info;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class newLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			
			String dbUsername="root";
			String dbPassword="@Mysql";
			String dbSchema="ebill";
			String url="jdbc:mysql://localhost:3306/ebill";
			String action=request.getParameter("action");
			
			try {
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con=DriverManager.getConnection(url,dbUsername,dbPassword);
				
				if("register".equals(action)){
					
				String name=request.getParameter("name");
				String phonenumber=request.getParameter("phoneNumber");
				String email=request.getParameter("email");
				String password=request.getParameter("password");
				String address=request.getParameter("address");
				
				
				
				String checkQuery="Select * from userinfo where Email=?;";
				PreparedStatement checkstmt=con.prepareStatement(checkQuery);
				checkstmt.setString(1,email);
				ResultSet rs=checkstmt.executeQuery();
				
				if(rs.next()) {
					response.sendRedirect("homePage.jsp?message=Email_exists");
				}else {
				
				String insertQuery="Insert into userinfo(customerName,phoneNumber,Email,userPassword,Address) VALUES(?,?,?,?,?);";
				PreparedStatement Pre=con.prepareStatement(insertQuery);
				Pre.setString(1, name);
				Pre.setString(2,phonenumber);
				Pre.setString(3, email);
				Pre.setString(4, password);
				Pre.setString(5, address);
				int rowsInserted =Pre.executeUpdate();
				
				if (rowsInserted > 0) {
					
					
	                System.out.println("Registration successfull!");
	                response.sendRedirect("loginPage.jsp?message=Registered successfully!");
	            } else {
	                System.out.println("Data insertion failed.");
	                response.sendRedirect("loginPage.jsp?message=login failed");
	            }
				}
				
				}else if("login".equals(action)){
					
					String userName=request.getParameter("username");
					String passWord=request.getParameter("password");
					String searchQuery="Select * from userinfo where customerName=? and userPassword=?;";
					PreparedStatement pre=con.prepareStatement(searchQuery);
					pre.setString(1, userName);
					pre.setString(2,passWord);
					ResultSet rs=pre.executeQuery();
					if(rs.next()) {
						System.out.println("Login Successfull");
						response.sendRedirect("dashboard.jsp?message=login successful");
						
					}else {
						response.getWriter().println("Invalid email or password.");
						response.sendRedirect("loginPage.jsp?message=login failed");
						
					}
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
