//Ex4\src\main\webapp
<!DOCTYPE html>
<html>

<head>
    <title>User Registration</title>

    <style>
        body {
            font-family: Arial;
            background: #f2f2f2;
        }

        .box {
            width: 350px;
            margin: 60px auto;
            padding: 20px;
            background: white;
            box-shadow: 0 0 8px gray;
        }

        input {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
            box-sizing: border-box;
        }

        input[type=submit] {
            background: #333;
            color: white;
            border: 0;
        }

        h2 {
            text-align: center;
        }
    </style>
</head>

<body>

    <div class="box">

        <h2>User Registration Form</h2>

        <form action="RegisterServlet" method="post">

            <label>Name</label>
            <input type="text" name="name" required>

            <label>Email</label>
            <input type="email" name="email" required>

            <label>Password</label>
            <input type="password" name="password" required>

            <input type="submit" value="Register">

        </form>

    </div>

</body>
</html>
