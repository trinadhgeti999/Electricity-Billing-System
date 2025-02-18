<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
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
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 10px;
        }

        h1 {
            color: #0073e6 ;
            font-size: 26px;
            margin-bottom: 15px;
        }

        .bill-container {
            background: #ffffff;
            border-radius: 10px;
            padding: 15px;
            width: 90%;
            max-width: 450px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            font-size: 14px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background: #0073e6;
            color: white;
        }

        tr:nth-child(even) {
            background: #f9f9f9;
        }

        tr:last-child {
            font-size: 16px;
            font-weight: bold;
            background: #0073e6;
            color: white;
        }

        .pay-button {
            margin-top: 15px;
            background: #28a745;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            transition: 0.3s;
        }

        .pay-button:hover {
            background: #218838;
        }

        .disabled-button {
            background: #6c757d !important;
            cursor: not-allowed;
        }

        .quote-container {
            position: absolute;
            bottom: 5px;
            width: 100%;
            display: flex;
            justify-content: center;
        }

        .quote {
            font-size: 14px;
            font-style: italic;
            color: #555;
            background: #e0f7fa;
            padding: 8px 15px;
            border-radius: 10px;
            text-align: center;
            max-width: 80%;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
        }
    </style>

    <script>
    function payBill() {
        let serviceNumber = "<%= request.getParameter("serviceNumber") %>";
        
        
        if (!serviceNumber || serviceNumber.trim() === "") {
            document.getElementById("error-message").innerText = "Invalid Service Number!";
            return;
        }

        let payButton = document.getElementById("payButton");
        payButton.innerText = "Paid";
        payButton.classList.add("disabled-button");
        payButton.disabled = true;

        
        localStorage.setItem("billPaid_" + serviceNumber, "true");

        alert("Payment Successful! Thank you for paying your bill.");
    }

    window.onload = function () {
        let serviceNumber = "<%= request.getParameter("serviceNumber") %>";

        
        if (localStorage.getItem("billPaid_" + serviceNumber) === "true") {
            let payButton = document.getElementById("payButton");
            payButton.innerText = "Paid";
            payButton.classList.add("disabled-button");
            payButton.disabled = true;
        }
    };


    </script>
</head>
<body>

    <h1>Electricity Bill Payment</h1>

    <div class="bill-container">
        <h3>Service Number: <%= request.getParameter("serviceNumber") %></h3>
        <h4>Name : <%= request.getParameter("Name") %></h4>
        <h4>Phone Number : <%= request.getParameter("phoneno") %></h4>
        <h4>Address : <%= request.getParameter("address") %></h4>

        <table>
            <tr>
                <th>Charges</th>
                <th>Amount (₹)</th>
            </tr>
            <tr>
                <td>Energy Charge</td>
                <td><%= request.getParameter("billAmount") %></td>
            </tr>
            <tr>
                <td>Fixed Charge</td>
                <td><%= request.getParameter("fixedCharge") %></td>
            </tr>
            <tr>
                <td>Electricity Duty (5%)</td>
                <td><%= request.getParameter("electricityDuty") %></td>
            </tr>
            <tr>
                <td>GST (18%)</td>
                <td><%= request.getParameter("gst") %></td>
            </tr>
            <tr>
                <th>Total Bill</th>
                <th>₹<%= request.getParameter("totalBill") %></th>
            </tr>
        </table>

        <button id="payButton" class="pay-button" onclick="payBill()">Pay Bill</button>
    </div>

    <div class="quote-container">
        <div class="quote">
            ⚡ "Power your home, empower your future! Pay on time, stay stress-free." ⚡
        </div>
    </div>

</body>
</html>
