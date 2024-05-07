@isTest
public class TestSendEmailToAccount {
	 static testMethod void testSendEmailToAccountCreated() {
        // Cria uma conta para teste
        Account testAcc = new Account(Name='Test Account', Country__c = 'a00bm000003tS8PAAU', Email__c='marisnsilva@gmail.com');
        insert testAcc;

        // Executa o método em um bloco de teste
        Test.startTest();
        SendEmailToAccount.sendEmailToAccountCreated(new List<Account>{testAcc});
		Integer invocations = Limits.getEmailInvocations();       
        Test.stopTest();

        // Adiciona asserção para verificar se o e-mail foi enviado corretamente
        system.assertEquals(1, invocations, 'An email should be sent');
    }
    
    static testMethod void testSendEmailToAccountUpdated() {
        // Cria uma conta para teste
        Account testAcc = new Account(Name='Test Account', Country__c = 'a00bm000003tS8PAAU', Email__c='marisnsilva@gmail.com');
        insert testAcc;
        
        // Atualiza a conta
        testAcc.name = 'Teste Account 2';
        update testAcc;
        
         // Executa o método em um bloco de teste
        Test.startTest();
        SendEmailToAccount.sendEmailToAccountUpdated(new List<Account>{testAcc});
		Integer invocations = Limits.getEmailInvocations();       
        Test.stopTest();
        
         // Adiciona asserção para verificar se o e-mail foi enviado corretamente
        system.assertEquals(1, invocations, 'An email should be sent');
    }
  }