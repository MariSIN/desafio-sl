// Esta é uma classe global do Salesforce Apex chamada 'ScheduleDeleteOrders' que implementa a interface 'Schedulable'.
// A interface 'Schedulable' é usada para marcar classes que contêm operações que devem ser executadas em um horário específico.
global with sharing class ScheduleDeleteOrders implements Schedulable {
    // O método 'execute' é chamado quando a operação agendada é acionada.
    global void execute(SchedulableContext sc){
    // 'Database.executeBatch' é uma chamada de método que inicia um trabalho em lote. 
    
    // 'new DeleteOrders()' cria uma nova instância da classe 'DeleteOrders', que é passada como o primeiro argumento para 'executeBatch'.

    // '200' é o tamanho do lote, que é passado como o segundo argumento para 'executeBatch'. Isso significa que o trabalho em lote processará até 200 registros por vez.   
        Database.executeBatch(new DeleteOrders(), 200);
    }
}