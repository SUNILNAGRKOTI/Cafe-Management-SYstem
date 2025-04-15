<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login/Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }

        body {
            background: linear-gradient(135deg, #1abc9c, #16a085);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 15px;
        }

        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 420px;
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #16a085;
            font-size: 24px;
        }

        .form-box {
            display: none;
        }

        .form-box.active {
            display: block;
        }

        .input-box {
            margin-bottom: 18px;
        }

        .input-box input {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .input-box input:focus {
            border-color: #1abc9c;
            outline: none;
            box-shadow: 0 0 6px rgba(26, 188, 156, 0.4);
        }

        .btn {
            width: 100%;
            background-color: #1abc9c;
            color: white;
            padding: 14px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #148f77;
        }

        .footer-text {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }

        .footer-text a {
            color: #1abc9c;
            text-decoration: none;
            font-weight: 600;
        }

        .footer-text a:hover {
            text-decoration: underline;
        }

        #message {
            display: none;
            margin-bottom: 15px;
            padding: 12px;
            border-radius: 6px;
            font-size: 14px;
            text-align: center;
        }

        #message.success {
            background-color: #d4edda;
            color: #155724;
        }

        #message.error {
            background-color: #f8d7da;
            color: #721c24;
        }

        @media (max-width: 500px) {
            .container {
                padding: 25px;
            }
        }
    </style>
</head>
<body>

<div id="message" class="message"></div>

<div class="container">
    <!-- Login Form -->
    <div class="form-box login active">
        <h1>Login</h1>
        <form action="login_signupServlet" method="post" onsubmit="return validateLoginForm()">
            <input type="hidden" name="action" value="login">
            <div class="input-box">
                <input type="email" name="email" id="loginEmail" placeholder="Email" required>
            </div>
            <div class="input-box">
                <input type="password" name="password" id="loginPassword" placeholder="Password" required>
            </div>
            <button type="submit" class="btn">Login</button>
            <div class="footer-text">
                Don't have an account? <a href="#" id="register-link">Register here</a>
            </div>
        </form>
    </div>

    <!-- Register Form -->
    <div class="form-box register">
        <h1>Register</h1>
        <form action="login_signupServlet" method="post" onsubmit="return validateRegisterForm()">
            <input type="hidden" name="action" value="register">
            <div class="input-box">
                <input type="text" name="name" id="regName" placeholder="Full Name" required>
            </div>
            <div class="input-box">
                <input type="email" name="email" id="regEmail" placeholder="Email" required>
            </div>
            <div class="input-box">
                <input type="text" name="phone" id="regPhone" placeholder="Phone (10 digits)" required>
            </div>
            <div class="input-box">
                <input type="password" name="password" id="regPassword" placeholder="Password" required>
            </div>
            <button type="submit" class="btn">Register</button>
            <div class="footer-text">
                Already have an account? <a href="#" id="login-link">Login here</a>
            </div>
        </form>
    </div>
</div>

<script>
    const loginForm = document.querySelector('.form-box.login');
    const registerForm = document.querySelector('.form-box.register');
    const registerLink = document.getElementById('register-link');
    const loginLink = document.getElementById('login-link');

    registerLink.addEventListener('click', (e) => {
        e.preventDefault();
        loginForm.classList.remove('active');
        registerForm.classList.add('active');
    });

    loginLink.addEventListener('click', (e) => {
        e.preventDefault();
        registerForm.classList.remove('active');
        loginForm.classList.add('active');
    });

    function validateLoginForm() {
        const email = document.getElementById('loginEmail').value.trim();
        const password = document.getElementById('loginPassword').value.trim();

        if (!email || !password) {
            alert("All login fields are required!");
            return false;
        }
        return true;
    }

    function validateRegisterForm() {
        const name = document.getElementById('regName').value.trim();
        const email = document.getElementById('regEmail').value.trim();
        const phone = document.getElementById('regPhone').value.trim();
        const password = document.getElementById('regPassword').value.trim();

        if (!name || !email || !phone || !password) {
            alert("All registration fields are required!");
            return false;
        }

        const phoneRegex = /^[0-9]{10}$/;
        if (!phoneRegex.test(phone)) {
            alert("Phone must be 10 digits only.");
            return false;
        }

        if (password.length < 6) {
            alert("Password must be at least 6 characters.");
            return false;
        }

        return true;
    }
</script>

</body>
</html>

