@isTest
public class TestRestOrder {
    static testMethod void restOrder() {
        Pais__c country = new Pais__c(Name='Brasil', Sigla__c='BR', Idioma__c='Português');
        insert country;
        
        // Cria uma conta para teste
        Account testAccount = new Account(Name='Test Account', Email__c='mari@gmail.com', Country__c=country.Id);
        insert testAccount;
        
        // Cria uma ordem para teste
        Order__c testOrder = new Order__c(Account__c = testAccount.Id, Total__c = 250);
        
        // Cria uma solicitação de teste
        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();
        
        // Define o URI do recurso REST que você está tentando acessar.
        req.requestUri = '/services/apexrest/Order__c/';
        
        // Define o método HTTP que você está usando para a solicitação.
        req.httpMethod = 'POST';
        
        // Define o corpo da solicitação. Você está serializando uma lista de pedidos (neste caso, apenas 'testOrder') em uma string JSON e convertendo-a em um Blob.
        req.requestBody = Blob.valueOf(JSON.serialize(new List<Order__c>{testOrder}));
        
        // Define o corpo da resposta como 'OK'. Isso geralmente é feito no lado do servidor (não no cliente) para indicar que a solicitação foi processada com sucesso.
        res.responseBody = Blob.valueOf('OK');
        
        
        // Adiciona a solicitação e resposta ao RestContext
        RestContext.request = req;
        RestContext.response = res;
        
        // Executa o método em um bloco de teste
        Test.startTest();
        RestOrder.createOrder();
        Test.stopTest();
        
        //Asserções
        System.assertNotEquals(res.responseBody.toString(), 'A resposta não deve ser nula.');
        System.assertEquals(res.responseBody.toString(), 'OK');
        System.assertEquals(200, res.statusCode);
    }
}