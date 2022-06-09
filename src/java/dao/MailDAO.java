/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author Minh Hoàng
 */
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

public class MailDAO {

    public static void sendMail(String toEmail, int id, String emailBody) throws MessagingException, UnsupportedEncodingException {

        final String fromEmail = "minhhoangdemo@gmail.com";
        // Mat khai email cua ban
        final String password = "hoanganasd123";

        final String subject = "[VegetableFruit Shop] Xác nhận đơn hàng #" + id;
        final String body = "Hello Admin";

//        Properties props = new Properties();
//        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
//        props.put("mail.smtp.port", "587"); //TLS Port
//        props.put("mail.smtp.auth", "true"); //enable authentication
//        props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
        Properties p = new Properties();
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.starttls.enable", "true");
        p.put("mail.smtp.host", "smtp.gmail.com");
        p.put("mail.smtp.port", 587);

//        Authenticator auth = new Authenticator() {
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication(fromEmail, password);
//            }
//        };
//        Session session = Session.getInstance(props, auth);
        Session s = Session.getInstance(p,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(fromEmail, password);
                    }
                });

        Message msg = new MimeMessage(s);
        msg.setFrom(new InternetAddress(fromEmail, "NoReply-JD"));
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(fromEmail, false));
        msg.setSubject(subject);
        msg.setText(body);
        Transport.send(msg);
//        MimeMessage msg = new MimeMessage(session);
//        //set message headers
//        msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
//        msg.addHeader("format", "flowed");
//        msg.addHeader("Content-Transfer-Encoding", "8bit");
//
//        msg.setFrom(new InternetAddress(fromEmail, "NoReply-JD"));
//
//        msg.setReplyTo(InternetAddress.parse(fromEmail, false));
//
//        msg.setSubject(subject, "UTF-8");
//
//        msg.setContent(emailBody, "text/html");
//
//        msg.setSentDate(new Date());
//
//        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
//        Transport.send(msg);
    }

    public static void main(String[] args) throws MessagingException, UnsupportedEncodingException {
        sendMail("huynhdominhhoang6601@gmail.com", 1, "asd");
    }
}
