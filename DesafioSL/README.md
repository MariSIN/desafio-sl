## Classes
### Auxiliares
1. SendEmailAccount   
- Envia um e-mail para quem criou o e-mail (OwnerId) quando uma conta é criada ou atualizada.

2. SendEmailToAccount
- Envia um e-mail para o e-mail cadastrado na conta, quando a conta é criada ou  atualizada.


### Rest Controllers

1. RestOrder 
- Define um endpoint POST para criar registros Order__c. Quando uma solicitação POST é recebida, o método createOrder() é chamado para inserir os pedidos. Se bem-sucedido, retorna o status 200, se não, retorna o status 500 com a mensagem de erro. Este controlador REST permite a criação de registros Order__c através de serviços externos.

2. RestAccount
- Permite criar ou atualizar registros Account através de um endpoint POST. Quando uma solicitação POST é recebida, o método RestAccount() é chamado para realizar a operação “upsert”. Se bem-sucedido, retorna o status 200, se não, retorna o status 500 com a mensagem de erro. Este controlador REST permite a criação de registros Account através de serviços externos.

### Deleção em Massa
1. DeleteOrders
-  Trabalho em lote que deleta registros Order__c antigos. Ela busca os registros, deleta-os em lotes e envia um email com o status do trabalho.

2. ScheduleDeleteOrders
- Agendador que inicia o trabalho em lote DeleteOrders para excluir registros.

### Testes
1. TestDeleteOrders
- Testa a classe DeleteOrders.

2. TestRestAccount
- Testa a classe RestAccount.

3. TestRestOrder
- Testa a classe RestOrder.

4. TestSendEmail
- Testa os envios dos emails.

## Triggers
1. SendEmailAfterCreatedAccount
- Gatilho que é acionado após a criação ou atualização de uma conta.
- Se o campo acc.Send_Email_Confirmation__c, que é uma checkbox, estiver ativo,  esta Trigger ativa as classes sendEmailToAccountCreated e sendEmailToAccountUpdated, ou seja, envia para o email da conta uma notificação de email quando ela é criada ou atualizada.
- Independete do campo acc.Send_Email_Confirmation__c, o email de criação e atualização da conta sempre é enviado para o criador da conta (OwnerId).

## LWC
1. editEmail
- Um form de edição para o campo email.
- Neste form também existe uma checkbox onde se ativada a notificação de email é enviada para o email da conta.
- Se a atualização do email for um sucesso, aparece uma mensagem na tela.

## Objetos
1. Account - objeto padrão
- Foram criados  campos em Account: Email__c, Country__c, Country_Informations__c, Send_Email_Confirmation__c, Total_Sales_Amount__c.
- Email__c é um campo de email.
- Country__c é um campo de relacionamento de pesquisa com o objeto País.
- Country_Informations__c é um campo de fórmula que trás detalhado as informações sobre o país.
- Send_Email_Confirmation__c é a checkbox que o usuário permite enviar ou não uma notificação de email.
- Total_Sales_Amount__c é um campo de resumo de totalização, que soma o valor total de todos os pedidos realizado por esta conta.

2. Pais__c - objeto personalizado
- Name é o nome do país.
- Idioma__c é referente ao idioma do país.
- Moeda__c é referente a moeda do país (ex.: Real).
- Sigla__c é a sigla do país (ex.: BR), é um valor único.

3. Order__c - objeto personalizado
- Account__c faz um relacionamento mestre-detalhes com Account.
- Name é um número autogerado.
- Total__c é o valor total do pedido.

## Apex Jobs
- Foi criado um agendamento de limpeza diária dos registros de pedidos que não são modificados a mais de 3 meses. Esse processo é feito através da classe ScheduleDeleteOrders.