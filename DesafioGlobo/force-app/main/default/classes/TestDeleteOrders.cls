@isTest
public class TestDeleteOrders {    
    static testMethod void setup() {
        List<Order__c> orders = new List<Order__c>();
        
        for (Integer i = 0; i < 10; i ++) {
            String orderJson = '{"Account__c": "001bm000007iVosAAE", "Total__c" : "250", "LastModifiedDate" : "2024-02-01"}';
            Order__c order = (Order__c) JSON.deserialize(orderJson, Order__c.class);
            orders.add(order);
        }
        
        insert orders;
    }
    
    static testMethod void test() {
        Test.startTest();
        DeleteOrders massDeleteOrders = new DeleteOrders();
        Id batchId = Database.executeBatch(massDeleteOrders);
        Test.stopTest();
        
        Date threeMonthsFromToday = Date.Today().addMonths(-3);
        
        System.assertEquals(0, [SELECT count() FROM Order WHERE LastModifiedDate < :threeMonthsFromToday ]); 
    }
}