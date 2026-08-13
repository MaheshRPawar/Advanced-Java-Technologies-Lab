//Ex3\src\main\webapp
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    String course = request.getParameter("course");

    boolean submitted = name != null && age != null && course != null;
%>

<!DOCTYPE html>
<html>

<head>

    <title>Student Information</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fb;
            margin: 0;
            padding: 50px;
        }

        .box {
            width: 400px;
            margin: auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 7px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            width: 100%;
            padding: 11px;
            margin-top: 25px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 15px;
        }

        button:hover {
            background-color: #555;
        }

        .detail {
            background-color: #f1f1f1;
            padding: 13px;
            margin: 12px 0;
            border-radius: 5px;
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #333;
            text-decoration: none;
        }

        .back:hover {
            text-decoration: underline;
        }

    </style>

</head>

<body>

<div class="box">

<% if (!submitted) { %>

    <h2>Student Information</h2>

    <form method="post" action="student.jsp">

        <label>Name</label>

        <input type="text"
               name="name"
               placeholder="Enter your name"
               required>

        <label>Age</label>

        <input type="number"
               name="age"
               placeholder="Enter your age"
               required>

        <label>Course</label>

        <input type="text"
               name="course"
               placeholder="Enter your course"
               required>

        <button type="submit">Submit</button>

    </form>

<% } else { %>

    <h2>Student Profile</h2>

    <div class="detail">
        <b>Name:</b> <%= name %>
    </div>

    <div class="detail">
        <b>Age:</b> <%= age %>
    </div>

    <div class="detail">
        <b>Course:</b> <%= course %>
    </div>

    <a class="back" href="student.jsp">
        Back to Form
    </a>

<% } %>

</div>

</body>

</html>
