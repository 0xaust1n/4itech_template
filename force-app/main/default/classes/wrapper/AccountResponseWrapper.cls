public class AccountResponseWrapper {
  //Wrapper for API , nor Trigger
  public String name;

  public AccountResponseWrapper(Account acc) {
    this.name = acc.Name;
  }
  public static AccountResponseWrapper parseJson(String jsonString) {
    return (AccountResponseWrapper) System.JSON.deserialize(
      jsonString,
      AccountResponseWrapper.class
    );
  }
}
