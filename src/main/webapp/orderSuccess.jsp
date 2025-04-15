<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Success - FOOD PLACE CAFE</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #a8e063, #56ab2f);
            color: white;
            font-family: 'Poppins', sans-serif;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        
        .success-container {
            background: rgba(0, 0, 0, 0.8);
            border-radius: 15px;
            padding: 40px;
            max-width: 600px;
            text-align: center;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
        }
        
        .success-icon {
            font-size: 80px;
            color: #4CAF50;
            margin-bottom: 20px;
        }
        
        .success-title {
            color: #4CAF50;
            font-size: 28px;
            margin-bottom: 20px;
        }
        
        .success-message {
            font-size: 18px;
            margin-bottom: 30px;
        }
        
        .btn-container {
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <div class="success-container">
        <div class="success-icon">✓</div>
        <h1 class="success-title">Order Placed Successfully!</h1>
        <p class="success-message">Thank you for your order. Your delicious food will be on its way soon!</p>
        
        <div class="btn-container">
            <a href="dashboard.jsp" class="btn btn-primary">Back to Dashboard</a>
            <a href="menu" class="btn btn-success">Order More Food</a>
            <a href="order" class="btn btn-info">View Your Orders</a>
        </div>
    </div>
</body>
</html>
