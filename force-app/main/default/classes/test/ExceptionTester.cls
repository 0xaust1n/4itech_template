public with sharing class ExceptionTester {
  public ExceptionTester() {
    try {
      String input = 'abc';
      VerifyInput.verifyNumber(input);
    } catch (Exception e) {
      System.debug(e.getTypeName());
    }
  }
}
