<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<style>
    
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        background-image: url('images/bulb1.jpg'); 
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        flex-direction: column;
        position: relative;
    }

    
    body::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5); 
        z-index: -1;
    }

    
    h1 {
        color: white;
        font-size: 20px; 
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        margin-bottom: 5px;
    }

    h2 {
        color: white;
        font-size: 18px; 
        margin-bottom: 10px;
    }

    
    form {
        border: 2px solid rgba(255, 255, 255, 0.3);
        width: 320px;  
        padding: 15px;
        background-color: rgba(255, 255, 255, 0.1);
        box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.2);
        border-radius: 10px;
        backdrop-filter: blur(6px);
        text-align: center;
        color: white;
    }

    
    label {
        display: block;
        font-size: 12px; 
        margin-bottom: 3px;
        text-align: left;
        font-weight: bold;
    }

    
    input, textarea {
        width: 90%;
        padding: 6px;
        margin-bottom: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 12px;
        outline: none;
    }

    input:focus, textarea:focus {
        border-color: #ffcc00;
        box-shadow: 0px 0px 6px rgba(255, 204, 0, 0.8);
    }

    
    input[type="submit"] {
        background: linear-gradient(90deg, #ffcc00, #ff6600);
        color: white;
        font-size: 14px;
        font-weight: bold;
        border: none;
        cursor: pointer;
        padding: 8px;
        border-radius: 5px;
        transition: 0.3s ease;
    }

    input[type="submit"]:hover {
        background: linear-gradient(90deg, #ff6600, #ffcc00);
        box-shadow: 0px 4px 10px rgba(255, 204, 0, 0.5);
    }

    
    h4 {
        color: white;
        font-size: 12px;
        margin-top: 8px;
    }

    a {
        color: #ffcc00;
        text-decoration: none;
        font-weight: bold;
    }

    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <h1 style="font-size: 40px;">Welcome to E-bill</h1>
    <h2>Registration Form</h2>

    <form action="newLoginServlet" method="post">
    <input type="hidden" name="action" value="register">
        <label for="name">Name:</label>
        <input type="text" name="name" placeholder="Enter your name" required>

        <label for="phoneNo">Phone Number:</label>
        <input type="text" name="phoneNumber" placeholder="Enter your phone number" required>

        <label for="email">Email:</label>
        <input type="email" name="email" placeholder="Enter your email" required>

        <label for="password">Password:</label>
        <input type="password" name="password" placeholder="Set a strong password" required>

        <label for="confirmPassword">Confirm Password:</label>
        <input type="password" name="confirmPassword" placeholder="Confirm password" required>

        <label for="address">Address:</label>
        <textarea id="address" name="address" placeholder="Enter your address"></textarea>

        <input type="submit" value="Register">
    </form>

    <h4>Already have an account? <a href="loginPage.jsp">Login here</a></h4>
    <script>
        
        const urlParams = new URLSearchParams(window.location.search);
        const message = urlParams.get('message');

        
        if (message === 'Email_exists') {
            alert('Email already exists! Try again.');
        }
    </script>
</body>
</html>
