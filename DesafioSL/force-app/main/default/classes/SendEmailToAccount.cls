public with sharing class SendEmailToAccount {
    // O método 'sendEmailToAccountCreated' é usado para enviar emails quando uma conta é criada.
    public static void sendEmailToAccountCreated(List<Account> account) {
          // 'lstEmail' é uma lista que armazenará as mensagens de email a serem enviadas.
            List<Messaging.SingleEmailMessage> lstEmail = new List<Messaging.SingleEmailMessage>();
    
            // Itera sobre todas as contas na lista fornecida.
            for(Account acc : account) {
                 // Cria uma nova mensagem de email.
                Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
    
                // Define o destinatário do email.
                emailMsg.setToAddresses(new List<String>{ acc.Email__c });
    
                // Define o assunto do email.
                String emailSub = 'Sua conta foi criada com sucesso!';
                emailMsg.setSubject(emailSub);
    
                // Define o corpo do email.
                String content = 'Boas vindas ao Salesforce ' + acc.Name + '!';
                emailMsg.setHtmlBody(content);
    
                // Adiciona a mensagem de email à lista de emails a serem enviados.
                lstEmail.add(emailMsg);
            }  
            // Envia todos os emails na lista.
            Messaging.sendEmail(lstEmail); 
    }
    
        // O método 'sendEmailToAccountUpdated' é usado para enviar emails quando uma conta é atualizada.
        public static void sendEmailToAccountUpdated(List<Account> account) {
            // 'lstEmail' é uma lista que armazenará as mensagens de email a serem enviadas.
            List<Messaging.SingleEmailMessage> lstEmail = new List<Messaging.SingleEmailMessage>();

            // Itera sobre todas as contas na lista fornecida.
            for(Account acc : account) {
                // Cria uma nova mensagem de email.
                Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
    
                // Define o destinatário do email.
                emailMsg.setToAddresses(new List<String>{ acc.Email__c });
    
                // Define o assunto do email.
                String emailSub = 'Sua conta foi alterada com sucesso!';
                emailMsg.setSubject(emailSub);
    
                // Define o corpo do email.
                String content = acc.Name + ', sua conta foi atualizada com sucesso! Qualquer dúvida, entre em contato conosco através deste e-mail ';
                emailMsg.setHtmlBody(content);
    
                // Adiciona a mensagem de email à lista de emails a serem enviados.
                lstEmail.add(emailMsg);
            }  
            // Envia todos os emails na lista.
            Messaging.sendEmail(lstEmail); 
        }
    }