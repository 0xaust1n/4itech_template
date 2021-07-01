public class ResponseBodyWrapper {
  public static String GetResponseBody(
    String isSuccess,
    String code,
    String content
  ) {
    //init wrapper class
    ResponJsonWrapper wrapper = new ResponJsonWrapper();
    wrapper.success = isSuccess;
    //init messgae class
    ResponJsonWrapper.Message msg = new ResponJsonWrapper.Message();
    msg.code = code;
    msg.content = content;
    //pass message class to wrapper
    wrapper.message = msg;
    String json = JSON.serialize(wrapper);
    return json;
  }
}
