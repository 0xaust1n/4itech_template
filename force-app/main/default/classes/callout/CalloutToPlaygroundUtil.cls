public with sharing class CalloutToPlaygroundUtil {
  @future(callout=true)
  public static void getAccessToken() {
    String method = 'POST';
    String url = 'https://login.salesforce.com/services/oauth2/token?';
    url += 'grant_type=refresh_token&'; //add grant_type
    url += 'client_id=' + Constants.API_CLIENT_ID + '&';
    url += 'client_secret=' + Constants.API_CLIENT_SECRET + '&';
    url += 'refresh_token=' + Constants.API_REFRESH_TOKEN;
    HttpResponse response = HttpUtil.sendRequest(url, method);
    RefreshTokenResponseWrapper wrapper = RefreshTokenResponseWrapper.parseJson(response.getBody());
    List<Token__c> tokens = [SELECT Name, Value__c FROM Token__c WHERE Name = 'access_token' LIMIT 1];
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

  @future(callout=true)
  public static void createObject(String url, String stringBodyAsJson) {
    List<Token__c> tokens = [SELECT Value__c FROM Token__c WHERE Name = 'access_token'];
    String accessToken = tokens[0].Value__c;
    String method = 'POST';
    HttpResponse response = HttpUtil.sendRequest(url, method, stringBodyAsJson, accessToken);
  }

  @future(callout=true)
  public static void updateObject(String url, String stringBodyAsJson) {
    List<Token__c> tokens = [SELECT Value__c FROM Token__c WHERE Name = 'access_token'];
    String accessToken = tokens[0].Value__c;
    String method = 'PUT';
    HttpResponse response = HttpUtil.sendRequest(url, method, stringBodyAsJson, accessToken);
  }
}
