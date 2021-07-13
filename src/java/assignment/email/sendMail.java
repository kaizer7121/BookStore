/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assignment.email;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Kaizer
 */
public class sendMail {

    public static void sendMail(String toEmail, int size) throws AddressException, MessagingException {
        String fromEmail = "bookstore71211";
        String password = "bookstore1237";
        String messageText = "Your ordered successfully " + size + " items";
        String subject = "Thank you for buying book from my store";
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        };

        Session sessionMail = Session.getInstance(properties, auth);

        // creates a new e-mail message
        Message msg = new MimeMessage(sessionMail);

        msg.setFrom(new InternetAddress(fromEmail));
        InternetAddress[] toAddresses = {new InternetAddress(toEmail)};
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        msg.setText(messageText);
        Transport.send(msg);
    }
}
