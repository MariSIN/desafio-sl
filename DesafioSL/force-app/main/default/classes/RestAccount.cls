@RestResource(urlMapping='/Account/*')
global with sharing class RestAccount {
    // Método POST
    @HttpPost
    global static void RestAccount() {
       // RestRequest e RestResponse são objetos que contêm os detalhes da solicitação e resposta HTTP, respectivamente.
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;

        // Converte o corpo da solicitação HTTP em uma string.
        String reqBody = request.requestBody.toString(); 

        // Deserializa o corpo da solicitação em uma lista de contas.
        List<Account> accountsToUpsert = (List<Account>) JSON.deserialize(reqBody, List<Account>.class);

        try {
            upsert accountsToUpsert;
            
            // Se o upsert for bem-sucedido, define o código de status da resposta como 200
            response.StatusCode = 200;

        } catch (Exception e) {
            // Se ocorrer um erro durante o upsert, define o corpo da resposta como a mensagem de erro e o código de status como 500.
            RestContext.response.responseBody = Blob.valueOf('Error ' + e.getMessage());
            response.StatusCode = 500;
        }
    }
}