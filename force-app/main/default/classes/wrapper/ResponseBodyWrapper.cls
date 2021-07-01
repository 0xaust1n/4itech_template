public class ResponseBodyWrapper {
  public static String GetResponseBody(
    Boolean isSuccess,
    String statusCode,
    String content
  ) {
    String tab4 = '\t' + '\t';
    String tab2 = '\t';

    String body = '{' + '\n';
    body += tab2 + 'success:' + String.valueOf(isSuccess) + ',' + '\n';
    body += tab2 + 'message:{' + '\n';
    body += tab4 + 'code:' + statusCode + ',' + '\n';
    body += tab4 + 'content:' + content + '\n';
    body += tab2 + '}' + '\n';
    body += '}';

    return body;
  }
}
