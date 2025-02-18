<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style>
    
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        background-image: url('images/login-bg.jpg'); 
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

    
    form {
        border: 2px solid rgba(255, 255, 255, 0.3);
        width: 300px;
        padding: 20px;
        background-color: rgba(255, 255, 255, 0.1);
        box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.2);
        border-radius: 10px;
        backdrop-filter: blur(6px);
        text-align: center;
        color: white;
    }

    
    label {
        display: block;
        font-size: 14px;
        margin-bottom: 5px;
        text-align: left;
        font-weight: bold;
    }

    
    input {
        width: 90%;
        padding: 8px;
        margin-bottom: 12px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 14px;
        outline: none;
    }

    input:focus {
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
        padding: 10px;
        border-radius: 5px;
        transition: 0.3s ease;
    }

    input[type="submit"]:hover {
        background: linear-gradient(90deg, #ff6600, #ffcc00);
        box-shadow: 0px 4px 10px rgba(255, 204, 0, 0.5);
    }
</style>
</head>
<body>
    <form action="newLoginServlet" method="post">
    	<input type="hidden" name="action" value="login">
        <label for="Username">Name:</label>
        <input type="text" name="username" placeholder="Username" required>

        <label for="password">Password:</label>
        <input type="password" name="password" placeholder="Enter your password" required>

        <input type="submit" value="Login">
    </form>
    <script>
        
        const urlParams = new URLSearchParams(window.location.search);
        const message = urlParams.get('message');

        
        if (message === 'login failed') {
            alert('Invalid email or password! Try again.');
        }else if (message === 'Registered successfully!') {
            alert('Registered successfully!');
        }
    </script>
    
    
</body>
</html>
