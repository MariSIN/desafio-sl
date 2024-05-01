@RestResource(urlMapping='/Order__c/*')
global with sharing class RestOrder {
    @HttpPost
    global static String createOrder(String AccountID, Decimal Total) {
        Order__c thisOrder = new Order__c(Account__c = AccountID, Total__c = Total);
        insert thisOrder;
        return thisOrder.Id;
    }
}