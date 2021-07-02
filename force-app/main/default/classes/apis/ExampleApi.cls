@RestResource(urlMapping='/ExampleApi')
global class ExampleApi {
  //public variable
  public static Boolean isCreate;
  public static Boolean isSuccess;
  public static String statusCode;
  public static String content;
  public static RestRequest request;
  public static RestResponse response;

  //API Methods
  @HttpPost
  global static void createAccount() {
    try {
      request = RestContext.request;
      response = RestContext.response;
      //-------Your Code Start---------------
      ExampleWrapper wrapper = ExampleWrapper.parseJson(request.requestBody.toString()); //use wrapper pasre request body
      Account acc = new Account();
      acc.Name = wrapper.name;
      VerifyInput.verifyNumber(wrapper.phone);
      acc.Phone = wrapper.phone;
      insert acc;
      //-------Your Code End---------------
      isSuccess = true; //Always set true
      isCreate = true; //Set true when insert
      statusCode = SuccessMappingWrapper.GetSuccessStatusCode(isCreate);
      content = SuccessMappingWrapper.GetSuccessContent(isCreate);
    } catch (Exception e) {
      isSuccess = false; //Always set false in exception
      statusCode = ExceptionMappingWrapper.GetFailStatusCode(e.getTypeName());
      content = e.getMessage();
    } finally {
      //Always use finally to create response body
      response.statusCode = Integer.valueOf(statusCode.substring(0, 3));
      response.responseBody = Blob.valueOf(ResponseBodyWrapper.GetResponseBody(String.valueOf(isSuccess), statusCode, content));
    }
  }
}
