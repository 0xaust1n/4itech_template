public class GetAccessToken {
  public static HttpResponse GetResponseOfRefreshToken() {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    String url = 'https://login.salesforce.com/services/oauth2/token?';
    url += 'grant_type=refresh_token&'; //add grant_type
    url += 'client_id=' + Constants.API_CLIENT_ID + '&';
    url += 'client_secret=' + Constants.API_CLIENT_SECRET + '&';
    url += 'refresh_token=' + Constants.API_REFRESH_TOKEN;
    request.setEndpoint(url);
    request.setMethod('POST');
    HttpResponse response = http.send(request);
    System.debug('response code:' + response.getStatusCode());
    System.debug('response body:' + response.getBody());
    return response;
  }
}
