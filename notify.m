function [] = notify(msg)
% function [] = notify(msg)
%  - msg: text message to send via email
% Modify these three lines to reflect
% your account and password.
myaddress_to = 'TO_ADDRESS@DOMAIN.TLD';
myaddress_from = 'FROM_ADDRESS@DOMAIN.TLD';
mypassword = 'YOUR_PASSWORD'; % for the 'from' address!

setpref('Internet','E_mail',myaddress_from);
setpref('Internet','SMTP_Server','smtp.gmail.com');
setpref('Internet','SMTP_Username',myaddress_from);
setpref('Internet','SMTP_Password',mypassword);

props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', ...
                  'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');

sendmail(myaddress_to, 'matlab notification', msg);
