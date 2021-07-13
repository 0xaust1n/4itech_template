global class ScheduledGetAccessToken implements Schedulable {
  global void execute(SchedulableContext sc) {
    HttpResponse response = GetAccessToken.GetResponseOfRefreshToken();
    //parse response to wrapper
    RefreshTokenResponseWrapper wrapper = RefreshTokenResponseWrapper.parseJson(response.getBody());
    //get token from Sobject
    List<Token__c> tokens = [SELECT Id, Name, Value__c FROM Token__c WHERE Name = 'access_token' LIMIT 1];
    //exist or not
    System.debug(tokens);
    if (tokens.size() <= 0) {
      Token__c new_token = new Token__c();
      new_token.Name = 'access_token';
      new_token.Value__c = wrapper.access_token;
      insert new_token;
    } else {
      tokens[0].Value__c = wrapper.access_token;
      update tokens;
    }
  }
}
