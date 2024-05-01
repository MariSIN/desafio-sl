public with sharing class SendEmailAccount {
    private static String toAddress = 'mariana.sn.silva@gmail.com';

    public static void sendEmailNotificationCreatedAccount(List<Account> account) {
        List<Messaging.SingleEmailMessage> lstEmail = new List<Messaging.SingleEmailMessage>();

        for(Account acc : account) {

            Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();

            emailMsg.setToAddresses(new List<String>{toAddress, acc.OwnerId});

            String emailSub = 'A conta ' + acc.Id + ' foi criada com sucesso!';
            emailMsg.setSubject(emailSub);

            String content = 'A conta com nome ' + acc.Name + ' e com o id: '+ acc.Id + ' foi criada com sucesso!';
            emailMsg.setHtmlBody(content);

            lstEmail.add(emailMsg);
        } 
        Messaging.sendEmail(lstEmail); 
    }

    public static void sendEmailNotificationUpdatedAccount(List<Account> account) {
        List<Messaging.SingleEmailMessage> lstEmail = new List<Messaging.SingleEmailMessage>();

        for(Account acc : account) {
            Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();

            emailMsg.setToAddresses(new List<String>{toAddress, acc.OwnerId});

            String emailSub = 'A conta ' + acc.Id + ' foi alterada com sucesso!';
            emailMsg.setSubject(emailSub);

            String content = 'A conta com nome ' + acc.Name + ' e com o id: '+ acc.Id + ' foi alterada com sucesso!';
            emailMsg.setHtmlBody(content);

            lstEmail.add(emailMsg);
        }    
        Messaging.sendEmail(lstEmail); 
    }
}