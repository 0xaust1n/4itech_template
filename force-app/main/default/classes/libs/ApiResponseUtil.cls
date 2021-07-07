public with sharing class ApiResponseUtil {
  public static RestResponse buildRestResponse(RestResponse response, String isSuccess, String code, String content) {
    //init wrapper class
    MessageResponseWrapper wrapper = new MessageResponseWrapper();
    wrapper.success = isSuccess;
    //init messgae class
    MessageResponseWrapper.Message message = new MessageResponseWrapper.Message();
    message.MessageCode = code;
    message.MessageContent = content;
    //pass message class to wrapper
    wrapper.message = message;
    String body = JSON.serialize(wrapper);
    response.responseBody = buildBlobFromString(body);
    response.statusCode = Integer.valueOf(code.substring(0, 3));
    return response;
  }

  public static Blob buildBlobFromString(String responseAsString) {
    Blob responseAsBlob = Blob.valueOf(responseAsString);
    return responseAsBlob;
  }
}
