public with sharing class SendEmailToAccount {
    public static void sendEmailToAccountCreated(List<Account> account) {
            List<Messaging.SingleEmailMessage> lstEmail = new List<Messaging.SingleEmailMessage>();
    
            for(Account acc : account) {
                Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
    
                emailMsg.setToAddresses(new List<String>{ acc.Email__c });
    
                String emailSub = 'Sua conta foi criada com sucesso!';
                emailMsg.setSubject(emailSub);
    
                String content = 'Boas vindas ao Salesforce ' + acc.Name + '!';
                emailMsg.setHtmlBody(content);
    
                lstEmail.add(emailMsg);
            }  
            Messaging.sendEmail(lstEmail); 
    }
    
        public static void sendEmailToAccountUpdated(List<Account> account) {
            List<Messaging.SingleEmailMessage> lstEmail = new List<Messaging.SingleEmailMessage>();
    
            for(Account acc : account) {
                Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
    
                emailMsg.setToAddresses(new List<String>{ acc.Email__c });
    
                String emailSub = 'Sua conta foi alterada com sucesso!';
                emailMsg.setSubject(emailSub);
    
                String content = acc.Name + ', sua conta foi atualizada com sucesso! Qualquer dúvida, entre em contato conosco através deste e-mail ';
                emailMsg.setHtmlBody(content);
    
                lstEmail.add(emailMsg);
            }  
            Messaging.sendEmail(lstEmail); 
        }
    }