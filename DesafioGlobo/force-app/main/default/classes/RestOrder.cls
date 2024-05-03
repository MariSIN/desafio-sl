@RestResource(urlMapping='/Order__c/*')
global with sharing class RestOrder {
    // Método POST
    @HttpPost
    global static void createOrder() {
        // 'RestRequest' e 'RestResponse' são objetos que contêm os detalhes da solicitação e resposta HTTP, respectivamente.
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;

        // Converte o corpo da solicitação HTTP em uma string.
        String reqBody = request.requestBody.toString(); 

        // Deserializa o corpo da solicitação em uma lista de pedidos.
        List<Order__c> orderToPost = (List<Order__c>)JSON.deserialize(reqBody, List<Order__c>.class);

        try {
            insert orderToPost;

            // Se a inserção for bem-sucedida, define o código de status da resposta como 200.
            response.StatusCode = 200;
        } catch (Exception e) {
            // Se ocorrer um erro durante a inserção, define o corpo da resposta como a mensagem de erro e o código de status como 500.
            RestContext.response.responseBody = Blob.valueOf('Error ' + e.getMessage());
            response.StatusCode = 500;
        }
    }
}