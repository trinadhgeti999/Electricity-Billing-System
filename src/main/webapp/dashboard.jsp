<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Electricity Bill Payment</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            text-align: center;
        }

        
        .navbar {
            background: #0073e6;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }

        .nav-buttons {
            display: flex;
            gap: 10px;
        }

        .nav-buttons button {
            background: white;
            color: #0073e6;
            border: none;
            padding: 8px 15px;
            cursor: pointer;
            border-radius: 5px;
            transition: 0.3s;
        }

        .nav-buttons button:hover {
            background: #005bb5;
            color: white;
        }

        .container {
            margin-top: 40px;
            padding: 20px;
        }

        h1 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        form {
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            width: 90%;
            max-width: 400px;
            margin: 0 auto;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background: #28a745;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            width: 100%;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background: #218838;
        }

        
    </style>

    <script>
        
        
        function logout() {
            alert("Logged out successfully!");
        }

        window.onload = function () {
            const urlParams = new URLSearchParams(window.location.search);
            const message = urlParams.get('message');

            if (message === 'login successful') {
                alert('Login successful');
            }
            if (message === 'service number not valid') {
                document.getElementById('error-message').innerText = "Invalid service number";
                document.getElementById('error-message').style.color = "red";
                document.getElementById('error-message').style.marginTop = "10px";
                document.getElementById('error-message').style.fontWeight = "bold";
            }
            
        };
    </script>
    
</head>
<body>

    
    <div class="navbar">
        <h2>Electricity Bill System</h2>
        <div class="nav-buttons">
            <button onclick="alert('Need help? Contact support at trinadhgeti@gmail.com')">Help</button>
            <button onclick="alert('For inquiries, call: +91 9618913627 or 9502850367')">Contact Us</button>
            <a href="loginPage.jsp" ><button onclick="logout()">Logout</button></a>
        </div>
    </div>

    <div class="container">
        <h1>Easily manage and pay your electricity bills in just a few clicks!</h1>

        
        <form action="billCalculator" method="post">
            <label for="serviceno">Enter the service number</label>
            <input type="text" name="servicenumber" required>

            <label for="units">Enter units</label>
            <input type="text" name="units" required>

            <input type="submit" value="Generate Bill">
        </form>
        <p id="error-message" class="error"></p>
    </div>

    

</body>
</html>
