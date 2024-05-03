trigger SendEmailAfterCreatedAccount on Account (after insert, after update) {
    if (Trigger.isInsert && Trigger.isAfter) {
        for (Account acc : Trigger.new) {
            if(acc.Send_Email_Confirmation__c) {
                    SendEmailToAccount.sendEmailToAccountCreated(Trigger.new);
                } 
            }
        SendEmailAccount.sendEmailNotificationCreatedAccount(Trigger.new);
       
    } 

    if(Trigger.isUpdate && Trigger.isAfter){
        for (Account acc : Trigger.new) {
            if(acc.Send_Email_Confirmation__c) {
                    SendEmailToAccount.sendEmailToAccountUpdated(Trigger.new);
                } 
            }
        SendEmailAccount.sendEmailNotificationUpdatedAccount(Trigger.new);  
    }
}