global with sharing class ScheduleDeleteOrders implements Schedulable {
    global void execute(SchedulableContext sc){
        
        Database.executeBatch(new DeleteOrders(), 200);
    }
}