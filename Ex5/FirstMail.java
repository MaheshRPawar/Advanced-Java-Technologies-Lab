//Ex5\src\main\java\com\ajt 
package com.ajt; 
import java.io.IOException; 
import java.io.PrintWriter; 
import java.util.Properties; 
import jakarta.mail.Authenticator; 
import jakarta.mail.Message; 
import jakarta.mail.PasswordAuthentication; 
import jakarta.mail.Session; 
import jakarta.mail.Transport; 
import jakarta.mail.internet.InternetAddress; 
import jakarta.mail.internet.MimeMessage; 
import jakarta.servlet.ServletException; 
import jakarta.servlet.annotation.WebServlet; 
import jakarta.servlet.http.HttpServlet; 
import jakarta.servlet.http.HttpServletRequest; 
import jakarta.servlet.http.HttpServletResponse; 
@WebServlet("/FirstMail") 
public class FirstMail extends HttpServlet { 
    private static final long serialVersionUID = 1L; 
    protected void doPost(HttpServletRequest request, 
            HttpServletResponse response) 
            throws ServletException, IOException { 
        response.setContentType("text/html"); 
        PrintWriter out = response.getWriter(); 
        String from = "YourGmailID"; 
        String password = "YourAPPpassword"; 
        String to = request.getParameter("email"); 
        Properties props = new Properties(); 
        props.put("mail.smtp.host", "smtp.gmail.com"); 
        props.put("mail.smtp.port", "465"); 
        props.put("mail.smtp.auth", "true"); 
        props.put("mail.smtp.ssl.enable", "true"); 
        Session session = Session.getInstance(props, 
                new Authenticator() { 
                    protected PasswordAuthentication getPasswordAuthentication() { 
                        return new PasswordAuthentication(from, password); 
                    } 
                }); 
        try { 
            Message message = new MimeMessage(session); 
            message.setFrom(new InternetAddress(from)); 
            message.setRecipients( 
                    Message.RecipientType.TO, 
                    InternetAddress.parse(to)); 
            message.setSubject("Registration Successful"); 
            message.setText("Hello! Your registration was successful."); 
            Transport.send(message); 
            out.println("<h2>Email Sent Successfully!!</h2>"); 
        } catch (Exception e) { 
            out.println("<h2>Email Sending Failed</h2>"); 
            out.println(e.getMessage()); 
        } 
    } 
} 
