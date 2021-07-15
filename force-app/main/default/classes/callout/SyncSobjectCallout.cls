public class SyncSobjectCallout {
  @future(callout=true)
  public static void createCallout(String url, String stringBodyAsJson, String method) {
    List<Token__c> tokens = [SELECT Value__c FROM Token__c WHERE Name = 'access_token'];
    String accessToken = tokens[0].Value__c;
    HttpResponse response = HttpUtil.sendHttpToForPlayground(url, method, stringBodyAsJson, accessToken);
  }

  @future(callout=true)
  public static void updateCallout(String url, String stringBodyAsJson, String method) {
    List<Token__c> tokens = [SELECT Value__c FROM Token__c WHERE Name = 'access_token'];
    String accessToken = tokens[0].Value__c;
    HttpResponse response = HttpUtil.sendHttpToForPlayground(url, method, stringBodyAsJson, accessToken);
  }
}
