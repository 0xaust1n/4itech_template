@RestResource(urlMapping='/Example') //Create Item REST API Example
global class ExampleApi {
  //public variable
  public static Boolean isSuccess;
  public static String messageCode;
  public static String messageContent;
  public static RestRequest request;
  public static RestResponse response;

  //API Methods
  @HttpPost
  global static void createAccount() {
    isSuccess = true; //Always set true
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
    } catch (Exception e) {
      isSuccess = false; //Always set false in exception
      messageCode = FailureMappingWrapper.getFailureStatusCode(e.getTypeName());
      messageContent = e.getMessage();
    } finally {
      if (isSuccess) {
        messageContent = Constants.CREATED_MESSAGE_CONTENT;
        messageCode = Constants.CREATED_MESSAGE_CODE;
      }
      response = ApiResponseUtil.buildRestResponse(response, String.valueOf(isSuccess), messageCode, messageContent);
    }
  }
}
