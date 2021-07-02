public class ExampleWrapper {
  //Wrapper for API , nor Trigger
  public String name;
  public String phone;

  public static ExampleWrapper parseJson(String jsonString) {
    return (ExampleWrapper) System.JSON.deserialize(jsonString, ExampleWrapper.class);
  }
}
