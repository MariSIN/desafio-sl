@RestResource(urlMapping='/Order__c/*')
global with sharing class RestOrder {
    @HttpPost
    global static void createOrder() {
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        String reqBody = request.requestBody.toString(); 

        List<Order__c> orderToPost = (List<Order__c>)JSON.deserialize(reqBody, List<Order__c>.class);

        try {
            insert orderToPost;
            response.StatusCode = 200;
        } catch (Exception e) {
            RestContext.response.responseBody = Blob.valueOf('Error ' + e.getMessage());
            response.StatusCode = 500;
        }
    }
}