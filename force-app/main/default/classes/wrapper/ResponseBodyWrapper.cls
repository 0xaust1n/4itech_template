public class ResponseBodyWrapper {
  public static String GetResponseBody(
    String isSuccess,
    String code,
    String content
  ) {
    //init wrapper class
    ResponseJsonWrapper wrapper = new ResponseJsonWrapper();
    wrapper.success = isSuccess;
    //init messgae class
    ResponseJsonWrapper.Message msg = new ResponseJsonWrapper.Message();
    msg.code = code;
    msg.content = content;
    //pass message class to wrapper
    wrapper.message = msg;
    String json = JSON.serialize(wrapper);
    return json;
  }
}
