global with sharing class DeleteOrders implements Database.Batchable<sObject>, Database.Stateful {
     // O método 'start' é chamado no início do trabalho em lote. Ele retorna um 'Database.QueryLocator' que representa a consulta que será usada para buscar os registros a serem processados.
    public Database.QueryLocator start(Database.BatchableContext bc) {
        // Calcula a data de três meses atrás
        Date threeMonthsAgo = Date.Today().addMonths(-3);
        // Define a consulta para selecionar os IDs dos pedidos que foram modificados pela última vez antes de três meses atrás
        String query = 'SELECT Id FROM Order__c WHERE LastModifiedDate < :threeMonthsAgo';
        
        // Retorna um 'Database.QueryLocator' para a consulta definida
        //O Database.QueryLocator é um objeto que atua como um iterador para grandes conjuntos de dados. Ele é usado para processar registros em lotes no contexto de operações em lote do Apex.
        return Database.getQueryLocator(query);
    }
    
    // O método 'execute' é chamado para cada lote de registros. Ele recebe uma lista de registros e realiza a operação desejada.
    public void execute(Database.BatchableContext bc, List<Order> records){
        // Deleta os registros do lote
        delete records;
    }
    
    // O método 'finish' é chamado após todos os lotes terem sido processados. Ele é usado para realizar operações de limpeza ou pós-processamento.
    public void finish(Database.BatchableContext bc){ 
        // Busca informações sobre o trabalho em lote atual
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
                            JobItemsProcessed,
                            TotalJobItems, CreatedBy.Email
                            FROM AsyncApexJob
                            WHERE Id = :bc.getJobId()];
        // Cria uma nova mensagem de email
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

        // Define o destinatário do email
        String[] toAddresses = new String[]{'mariana.sn.silva@gmail.com'};
            
            
            try {
                // Define o destinatário, o assunto e o corpo do email
                mail.setToAddresses(toAddresses);
                mail.setSubject('Apex Sharing Recalculation ' + job.Status);
                mail.setPlainTextBody
                    ('The batch Apex job processed ' + job.TotalJobItems +
                     ' batches with '+ job.NumberOfErrors + ' failures.');
                // Envia o email
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            } catch(Exception e){
                 // Se ocorrer um erro ao enviar o email, registra o erro
                System.debug('Error sending email: ' + e.getMessage());
            }
        
    }
}