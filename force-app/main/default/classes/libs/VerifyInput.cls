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
    if (String.isBlank(num) || numberMatcher.matches() == false) {
      throw new InvalidNumberException('The number is invalid.');
    }
  }
}