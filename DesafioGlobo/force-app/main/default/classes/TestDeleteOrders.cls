@isTest
public class TestDeleteOrders {    
    // O método 'setup' é usado para configurar os dados de teste.
    static testMethod void setup() {
        // 'orders' é uma lista que armazenará os pedidos a serem inseridos.
        List<Order__c> orders = new List<Order__c>();
        
        // Cria 10 pedidos.
        for (Integer i = 0; i < 10; i ++) {
            // Define um JSON que representa um pedido.
            String orderJson = '{"Account__c": "001bm000007iVosAAE", "Total__c" : "250", "LastModifiedDate" : "2024-02-01"}';

            // Deserializa o JSON em um objeto 'Order__c'.
            Order__c order = (Order__c) JSON.deserialize(orderJson, Order__c.class);

            // Adiciona o pedido à lista de pedidos.
            orders.add(order);
        }
        // Insere os pedidos no banco de dados.
        insert orders;
    }

    // O método 'test' é usado para testar a classe 'DeleteOrders'.
    static testMethod void test() {
        // Inicia o teste.
        Test.startTest();

        // Cria uma nova instância da classe 'DeleteOrders'.
        DeleteOrders massDeleteOrders = new DeleteOrders();

        // Executa a classe 'DeleteOrders' como um trabalho em lote.
        Id batchId = Database.executeBatch(massDeleteOrders);

        // Para o teste.
        Test.stopTest();
        
        // Calcula a data de três meses atrás.
        Date threeMonthsFromToday = Date.Today().addMonths(-3);

        // Verifica se todos os pedidos que foram modificados pela última vez antes de três meses atrás foram excluídos.
        System.assertEquals(0, [SELECT count() FROM Order WHERE LastModifiedDate < :threeMonthsFromToday ]); 
    }
}