@RestResource(urlMapping='/ArrayRequst')
global class ArrayRequstApi {
  public static Boolean isSuccess;
  public static String messageCode;
  public static String messageContent;
  public static String messageData;
  public static RestRequest request;
  public static RestResponse response;

  @HttpGet
  global static void getMember() {
    //public variable
    isSuccess = true; //Always set true
    try {
      request = RestContext.request;
      response = RestContext.response;
      //-------Your Code Start--------------
      List<PhoneWrapper> wrapperList = (List<PhoneWrapper>) JSON.deserialize(
        request.requestBody.toString(),
        List<PhoneWrapper>.class
      );
      VerifyInput.verifyListSize(wrapperList);
      List<Account> resultList = new List<Account>();
      for (PhoneWrapper wrapper : wrapperList) {
        List<Account> tempList = [
          SELECT Id, Name, Phone
          FROM Account
          WHERE Phone = :wrapper.phone
        ];
        resultList.addAll(tempList);
      }
      VerifyInput.verifyListSize(resultList);

      List<ExampleWrapper> responseList = new List<ExampleWrapper>();
      for (Account acc : resultList) {
        ExampleWrapper tempWrap = new ExampleWrapper(acc);
        responseList.add(tempWrap);
      }
      messageData = JSON.serialize(responseList);
    } catch (Exception e) {
      isSuccess = false; //Always set false in exception
      messageCode = FailureMappingWrapper.getFailureStatusCode(e.getTypeName());
      messageContent = e.getMessage();
    } finally {
      if (isSuccess) {
        messageContent = Constants.OK_MESSAGE_CONTENT;
        messageCode = Constants.OK_MESSAGE_CODE;
      }
      response = ApiResponseUtil.buildRestResponse(
        response,
        String.valueOf(isSuccess),
        messageCode,
        messageContent,
        messageData
      );
    }
  }
}
