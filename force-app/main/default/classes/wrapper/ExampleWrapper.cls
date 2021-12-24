public class ExampleWrapper {
  //Wrapper for API , nor Trigger
  public String phone;
  public String name;
  public String Id;

  public ExampleWrapper(Account acc) {
    this.Id = acc.Id;
    this.phone = acc.Phone;
    this.name = acc.Name;
  }

  public static ExampleWrapper parseJson(String jsonString) {
    return (ExampleWrapper) System.JSON.deserialize(jsonString, ExampleWrapper.class);
  }
}
