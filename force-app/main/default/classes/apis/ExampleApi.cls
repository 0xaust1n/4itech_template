@RestResource(urlMapping='/ExampleApi')
global class ExampleApi {
  //public variable
  public Boolean isCreate;
  public Boolean isSuccess;
  public String statusCode;
  public String content;

  //API Methods
  @HttpPost
  global static void createAccount() {
    try {
      AccountWrapper wrapper = AccountWrapper.parseJson(
        request.requestBody.toString()
      ); //use wrapper pasre request body
      Account acc = new Account();
      acc.Name = wrapper.name;
      acc.Phone = wrapper.phone;
      insert accs;
      isSuccess = true; //Always Set true
      isCreate = true; //Set true when insert
    } catch (Exception e) {
      statusCode = getFailedStatusCode(e.getTypeName());
      content = e.getMessage();
      
  }
}
