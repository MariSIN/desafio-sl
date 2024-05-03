@RestResource(urlMapping='/Account/*')
global with sharing class RestAccount {
    @HttpPost
    global static void RestAccount() {
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        String reqBody = request.requestBody.toString(); 
        List<Account> accountsToUpsert = (List<Account>) JSON.deserialize(reqBody, List<Account>.class);

        try {
            upsert accountsToUpsert;
            response.StatusCode = 200;
        } catch (Exception e) {
            RestContext.response.responseBody = Blob.valueOf('Error ' + e.getMessage());
            response.StatusCode = 500;
        }
    }
}