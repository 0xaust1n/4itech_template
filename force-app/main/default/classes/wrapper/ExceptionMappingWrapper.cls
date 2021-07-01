public class ExceptionMappingWrapper {
  public static Map<String, String> eMap;

  public static String GetFailStatusCode(String e) {
    setMap();
    String statusCode = eMap.get(e);
    return statusCode;
  }

  public static void setMap() {
    eMap.put('AsyncException', '40001');
    eMap.put('BigObjectException', '40002');
    eMap.put('CalloutException', '40003');
    eMap.put('DmlException                   ', '40004');
    eMap.put('EmailException', '40005');
    eMap.put('ExternalObjectException', '40006');
    eMap.put('IllegalArgumentException', '40007');
    eMap.put('InvalidParameterValueException', '40008');
    eMap.put('LimitException', '40009');
    eMap.put('JSONException', '40010');
    eMap.put('ListException', '40011');
    eMap.put('MathException', '40012');
    eMap.put('NoAccessException', '40013');
    eMap.put('NoDataFoundException', '40014');
    eMap.put('NoSuchElementException', '40015');
    eMap.put('NullPointerException', '40016');
    eMap.put('QueryException', '40017');
    eMap.put('RequiredFeatureMissing', '40018');
    eMap.put('SearchException', '40019');
    eMap.put('SecurityException', '40020');
    eMap.put('SerializationException', '40021');
    eMap.put('SObjectException', '40022');
    eMap.put('StringException', '40023');
    eMap.put('TypeException', '40024');
    eMap.put('VisualforceException', '40025');
    eMap.put('XmlException', '40026');
    eMap.put('CustomExceptions.InvalidFutureDateException', '40027');
    eMap.put('CustomExceptions.InvalidNumberException', '40028');
  }
}
