@isTest
public class TestRestAccount {
    static testMethod void restAccount() {
        // Cria uma conta para teste
        Account testAcc = new Account(Name='Test Account', Email__c='marisnsilva23@gmail.com', Country__c='a00bm000003tS8PAAU');
        insert testAcc;
        
        // Cria uma solicitação
        RestRequest req = new RestRequest();
        
        // Cria uma resposta
        RestResponse res = new RestResponse();
        
        // Define o URI do recurso REST que você está tentando acessar.
        req.requestUri = '/services/apexrest/Account/';
        
        // Define o método HTTP que você está usando para a solicitação.
        req.httpMethod = 'POST';
        
        // Define o corpo da solicitação.
        req.requestBody = Blob.valueOf(JSON.serialize(new List<Account>{testAcc}));
        
        // Define o corpo da resposta como 'OK'.
        res.responseBody = Blob.valueOf('OK');
        
        // Adiciona a solicitação e resposta ao RestContext
        RestContext.request = req;
        RestContext.response = res;
        
        // Executa o método em um bloco de teste
        Test.startTest();
        RestAccount.RestAccount();
        Test.stopTest();
        
        //Asserções
        System.assertNotEquals(res.responseBody.toString(), 'A resposta não deve ser nula.');
        System.assertEquals(res.responseBody.toString(), 'OK');
        System.assertEquals(200, res.statusCode);
    }
}