public class SuccessMappingWrapper {
  public static String GetSuccessStatusCode(Boolean isCreate) {
    if (isCreate) {
      return '20100';
    } else {
      return '20000';
    }
  }

  public static String GetSuccessContent(Boolean isCreate) {
    if (isCreate) {
      return 'Created';
    } else {
      return 'ok';
    }
  }
}
