public with sharing class FailureMappingWrapper {
  public static String getFailureStatusCode(String exceptionName) {
    Map<String, String> exceptionMessageCodeMap = new Map<String, String>();
    exceptionMessageCodeMap.put('System.AsyncException', '40001');
    exceptionMessageCodeMap.put('System.BigObjectException', '40002');
    exceptionMessageCodeMap.put('System.CalloutException', '40003');
    exceptionMessageCodeMap.put('System.DmlException', '40004');
    exceptionMessageCodeMap.put('System.EmailException', '40005');
    exceptionMessageCodeMap.put('System.ExternalObjectException', '40006');
    exceptionMessageCodeMap.put('System.IllegalArgumentException', '40007');
    exceptionMessageCodeMap.put('System.InvalidParameterValueException', '40008');
    exceptionMessageCodeMap.put('System.LimitException', '40009');
    exceptionMessageCodeMap.put('System.JSONException', '40010');
    exceptionMessageCodeMap.put('System.ListException', '40011');
    exceptionMessageCodeMap.put('System.MathException', '40012');
    exceptionMessageCodeMap.put('System.NoAccessException', '40013');
    exceptionMessageCodeMap.put('System.NoDataFoundException', '40014');
    exceptionMessageCodeMap.put('System.NoSuchElementException', '40015');
    exceptionMessageCodeMap.put('System.NullPointerException', '40016');
    exceptionMessageCodeMap.put('System.QueryException', '40017');
    exceptionMessageCodeMap.put('System.RequiredFeatureMissing', '40018');
    exceptionMessageCodeMap.put('System.SearchException', '40019');
    exceptionMessageCodeMap.put('System.SecurityException', '40020');
    exceptionMessageCodeMap.put('System.SerializationException', '40021');
    exceptionMessageCodeMap.put('System.SObjectException', '40022');
    exceptionMessageCodeMap.put('System.StringException', '40023');
    exceptionMessageCodeMap.put('System.TypeException', '40024');
    exceptionMessageCodeMap.put('System.VisualforceException', '40025');
    exceptionMessageCodeMap.put('System.XmlException', '40026');
    exceptionMessageCodeMap.put('CustomExceptions.InvalidFutureDateException', '40027');
    exceptionMessageCodeMap.put('CustomExceptions.InvalidNumberException', '40028');
    exceptionMessageCodeMap.put('CustomExceptions.InvalidListSizeException', '40029');
    String messageCode = exceptionMessageCodeMap.get(exceptionName);
    return messageCode;
  }
}
