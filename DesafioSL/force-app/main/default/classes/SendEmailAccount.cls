public with sharing class SendEmailAccount {
    private static String toAddress = 'mariana.sn.silva@gmail.com';

    // O método 'sendEmailNotificationCreatedAccount' é usado para enviar notificações por email quando uma conta é criada.
    public static void sendEmailNotificationCreatedAccount(List<Account> account) {
        // 'lstEmail' é uma lista que armazenará as mensagens de email a serem enviadas.
        List<Messaging.SingleEmailMessage> lstEmail = new List<Messaging.SingleEmailMessage>();
        // Itera sobre todas as contas na lista fornecida.
        for(Account acc : account) {
            // Cria uma nova mensagem de email.
            Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();

            // Define os destinatários do email.
            emailMsg.setToAddresses(new List<String>{toAddress, acc.OwnerId});

            // Define o assunto do email.
            String emailSub = 'A conta ' + acc.Id + ' foi criada com sucesso!';
            emailMsg.setSubject(emailSub);

            // Define o corpo do email.
            String content = 'A conta com nome ' + acc.Name + ' e com o id: '+ acc.Id + ' foi criada com sucesso!';
            emailMsg.setHtmlBody(content);

            // Adiciona a mensagem de email à lista de emails a serem enviados.
            lstEmail.add(emailMsg);
        } 
        // Envia todos os emails na lista
        Messaging.sendEmail(lstEmail); 
    }

     // O método 'sendEmailNotificationUpdatedAccount' é usado para enviar notificações por email quando uma conta é atualizada.
    public static void sendEmailNotificationUpdatedAccount(List<Account> account) {
        // 'lstEmail' é uma lista que armazenará as mensagens de email a serem enviadas.
        List<Messaging.SingleEmailMessage> lstEmail = new List<Messaging.SingleEmailMessage>();

        // Itera sobre todas as contas na lista fornecida.
        for(Account acc : account) {
            // Cria uma nova mensagem de email.
            Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();

            // Define os destinatários do email.
            emailMsg.setToAddresses(new List<String>{toAddress, acc.OwnerId});

            // Define o assunto do email.
            String emailSub = 'A conta ' + acc.Id + ' foi alterada com sucesso!';
            emailMsg.setSubject(emailSub);

            // Define o corpo do email.
            String content = 'A conta com nome ' + acc.Name + ' e com o id: '+ acc.Id + ' foi alterada com sucesso!';
            emailMsg.setHtmlBody(content);

            // Adiciona a mensagem de email à lista de emails a serem enviados.
            lstEmail.add(emailMsg);
        }  
        // Envia todos os emails na lista.  
        Messaging.sendEmail(lstEmail); 
    }
}