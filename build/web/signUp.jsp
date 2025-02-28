<%-- 
    Document   : signUp
    Created on : Feb 28, 2025, 11:03:12 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up Page</title>
    </head>
    <body>
        <div>
            <h1>Sign up</h1>
            <form action="main" method="post">
                First Name: <input type="text" name="firstName" value="">
                Last Name: <input type="text" name="lastName" value=""> <br>
                Username: <input type="text" name="txtUser" value=""> <br>
                Password: <input type="password" id="Pa" name="txtPass" value=""> <br>
                Confirm password: <input type="password" name="txtConPass" value="" id="conPa" onblur="validatePasswords()"> <br>
                
                <!-- Error message container -->
                <p id="error-message" style="color: red; display: none"></p>
                
                <input type="submit" value="Sign Up" name="btAction">
            </form>
        </div>      
        
        <%
            String message = (String) request.getAttribute("message");
            Boolean success = (Boolean) request.getAttribute("success");
            if (message != null) {
        %>
            <p style="color: <%= success ? "greenyellow" : "red" %>"><%= message %></p>
            <% if (success) { %>
                <a href="login.html">Return to Sign In</a>
            <% } %>
        <%
            }
        %>

        <script>
            function validatePasswords() {
                // Get the password and confirm password values
                const pass = document.getElementById("Pa").value;
                const conPass = document.getElementById("conPa").value;

                // Get the error message element
                const errorMessage = document.getElementById("error-message");

                // Check if passwords match
                if (pass !== conPass) {
                    // Show the error message
                    errorMessage.textContent = "The passwords you entered do not match!"
                    errorMessage.style.display = "block";
                    return false; // Prevent form submission
                } else {
                    // Hide the error message if passwords match
                    errorMessage.style.display = "none";
                    return true; // Allow form submission
                }
            }
        </script>
    </body>
</html>
