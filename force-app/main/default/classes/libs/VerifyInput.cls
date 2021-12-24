public class VerifyInput extends CustomExceptions {
  public static void verifyFutureDate(Date d) {
    if (d == null || d <= system.today()) {
      throw new InvalidFutureDateException('The date must be in the future.');
    }
  }

  // Convert to string first.
  public static void verifyNumber(String num) {
    Pattern isNumbers = Pattern.Compile('^[0-9]+$');
    Matcher numberMatcher = isNumbers.matcher(num);
    if (String.isBlank(num) || !numberMatcher.matches()) {
      throw new InvalidNumberException('The number is invalid.');
    }
  }

  public static void verifyListSize(List<Object> obj) {
    if (obj == null) {
      throw new InvalidListSizeException('List is empty');
    }
    if (obj.size() < 1) {
      throw new InvalidListSizeException('List is empty');
    }
  }
}
