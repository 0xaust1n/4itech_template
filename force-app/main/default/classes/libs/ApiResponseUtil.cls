public with sharing class ApiResponseUtil {
  public static RestResponse buildRestResponse(RestResponse response, String isSuccess, String code, String content) {
    //init wrapper class
    MessageResponseWrapper wrapper = new MessageResponseWrapper();
    wrapper.success = isSuccess;
    //init messgae class
    MessageResponseWrapper.Message message = new MessageResponseWrapper.Message();
    message.code = code;
    message.content = content;
    //pass message class to wrapper
    wrapper.message = message;
    String body = JSON.serializePretty(wrapper);
    response.responseBody = buildBlobFromString(body);
    response.statusCode = Integer.valueOf(code.substring(0, 3));
    return response;
  }
  public static RestResponse buildRestResponse(RestResponse response, String isSuccess, String code, String content, String data) {
    //init wrapper class
    MessageResponseWrapper wrapper = new MessageResponseWrapper();
    wrapper.success = isSuccess;
    //init messgae class
    MessageResponseWrapper.Message messageWrapper = new MessageResponseWrapper.Message();
    messageWrapper.code = code;
    messageWrapper.content = content;
    //pass message class to wrapper
    wrapper.message = messageWrapper;
    wrapper.data = String.isNotEmpty(data) ? JSON.deserializeUntyped(data) : null;
    String StringBody = JSON.serializePretty(wrapper);
    response.responseBody = Blob.valueOf(StringBody);
    response.statusCode = Integer.valueOf(code.substring(0, 3));
    return response;
  }

  public static Blob buildBlobFromString(String responseAsString) {
    Blob responseAsBlob = Blob.valueOf(responseAsString);
    return responseAsBlob;
  }
}
