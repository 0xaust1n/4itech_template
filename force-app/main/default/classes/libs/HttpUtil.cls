public class HttpUtil {
  public static HttpResponse sendRequest(String url, String method, String stringBodyAsJson, String accessToken) {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint(url);
    request.setHeader('Content-Type', 'application/json;charset=UTF-8');
    request.setHeader('Authorization', 'Bearer ' + accessToken);
    request.setMethod(method);
    request.setBody(stringBodyAsJson);
    HttpResponse response = http.send(request);
    System.debug('response code:' + response.getStatusCode());
    System.debug('response body:' + response.getBody());
    return response;
  }

  //Call serivce api
  public static HttpResponse sendRequest(String url, String method) {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint(url);
    request.setMethod(method);
    HttpResponse response = http.send(request);
    System.debug('response code:' + response.getStatusCode());
    System.debug('response body:' + response.getBody());
    return response;
  }
}
