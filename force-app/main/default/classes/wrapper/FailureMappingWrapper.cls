public with sharing class FailureMappingWrapper {
  public static String getFailureStatusCode(String exceptionName) {
    Map<String, String> exceptionMessageCodeMap = new Map<String, String>();
    exceptionMessageCodeMap.put('AsyncException', '40001');
    exceptionMessageCodeMap.put('BigObjectException', '40002');
    exceptionMessageCodeMap.put('CalloutException', '40003');
    exceptionMessageCodeMap.put('DmlException', '40004');
    exceptionMessageCodeMap.put('EmailException', '40005');
    exceptionMessageCodeMap.put('ExternalObjectException', '40006');
    exceptionMessageCodeMap.put('IllegalArgumentException', '40007');
    exceptionMessageCodeMap.put('InvalidParameterValueException', '40008');
    exceptionMessageCodeMap.put('LimitException', '40009');
    exceptionMessageCodeMap.put('JSONException', '40010');
    exceptionMessageCodeMap.put('ListException', '40011');
    exceptionMessageCodeMap.put('MathException', '40012');
    exceptionMessageCodeMap.put('NoAccessException', '40013');
    exceptionMessageCodeMap.put('NoDataFoundException', '40014');
    exceptionMessageCodeMap.put('NoSuchElementException', '40015');
    exceptionMessageCodeMap.put('NullPointerException', '40016');
    exceptionMessageCodeMap.put('QueryException', '40017');
    exceptionMessageCodeMap.put('RequiredFeatureMissing', '40018');
    exceptionMessageCodeMap.put('SearchException', '40019');
    exceptionMessageCodeMap.put('SecurityException', '40020');
    exceptionMessageCodeMap.put('SerializationException', '40021');
    exceptionMessageCodeMap.put('SObjectException', '40022');
    exceptionMessageCodeMap.put('StringException', '40023');
    exceptionMessageCodeMap.put('TypeException', '40024');
    exceptionMessageCodeMap.put('VisualforceException', '40025');
    exceptionMessageCodeMap.put('XmlException', '40026');
    exceptionMessageCodeMap.put('InvalidFutureDateException', '40027');
    exceptionMessageCodeMap.put('InvalidNumberException', '40028');
    String subStirng = exceptionName.replace('CustomExceptions.', '');
    String messageCode = exceptionMessageCodeMap.get(subStirng);
    return messageCode;
  }
}
