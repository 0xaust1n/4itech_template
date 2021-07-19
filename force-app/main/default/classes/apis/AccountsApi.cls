@RestResource(urlMapping='/Accounts')
global class AccountsApi {
  public static Boolean isSuccess;
  public static String messageCode;
  public static String messageContent;
  public static RestRequest request;
  public static RestResponse response;

  @HttpPost
  global static void createAccounts() {
    isSuccess = true;
    try {
      request = RestContext.request;
      response = RestContext.response;
      //---------------------------------------
      String requestBody = request.requestBody.toString().trim();
      List<Account> accounts = (List<Account>) JSON.deserialize(requestBody, List<Account>.class);
      insert accounts;
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

  @HttpPut
  global static void updateAccounts() {
    isSuccess = true;
    try {
      request = RestContext.request;
      response = RestContext.response;
      //---------------------------------------
      String requestBody = request.requestBody.toString().trim();
      List<Account> accounts = (List<Account>) JSON.deserialize(requestBody, List<Account>.class);
      update accounts;
    } catch (Exception e) {
      isSuccess = false; //Always set false in exception
      messageCode = FailureMappingWrapper.getFailureStatusCode(e.getTypeName());
      messageContent = e.getMessage();
    } finally {
      if (isSuccess) {
        messageContent = Constants.OK_MESSAGE_CONTENT;
        messageCode = Constants.OK_MESSAGE_CODE;
      }
      response = ApiResponseUtil.buildRestResponse(response, String.valueOf(isSuccess), messageCode, messageContent);
    }
  }
}
