trigger TriggerAccount on Account (after insert, after update) {
    for(Account acc : Trigger.new) {
        if (acc.Country__c == null) {
            acc.Country__c = 'N/A';
        }
    }
}