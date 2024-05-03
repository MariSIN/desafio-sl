// Gatilho que é acionado após a criação ou atualização de uma conta.
trigger SendEmailAfterCreatedAccount on Account (after insert, after update) {
    if (Trigger.isInsert && Trigger.isAfter) {
         // Itera sobre todas as novas contas inseridas
        for (Account acc : Trigger.new) {
            if(acc.Send_Email_Confirmation__c) {
                // Envia um email para a conta recém-criada 
                // se a opção 'Send_Email_Confirmation__c' estiver ativada
                    SendEmailToAccount.sendEmailToAccountCreated(Trigger.new);
                } 
            }
        // Envia uma notificação de que a criada foi atualizada para quem criou
        SendEmailAccount.sendEmailNotificationCreatedAccount(Trigger.new);
       
    } 

    if(Trigger.isUpdate && Trigger.isAfter){
        for (Account acc : Trigger.new) {
            // Itera sobre todas as contas atualizadas
            if(acc.Send_Email_Confirmation__c) {
                // Envia um email para a conta atualizada 
                // se a opção 'Send_Email_Confirmation__c' estiver ativada
                    SendEmailToAccount.sendEmailToAccountUpdated(Trigger.new);
                } 
            }
        // Envia uma notificação de que a conta foi atualizada para quem criou
        SendEmailAccount.sendEmailNotificationUpdatedAccount(Trigger.new);  
    }
}