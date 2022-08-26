public class RefreshTokenResponseWrapper {
  public String access_token;

  public static RefreshTokenResponseWrapper parseJson(String jsonString) {
    return (RefreshTokenResponseWrapper) System.JSON.deserialize(
      jsonString,
      RefreshTokenResponseWrapper.class
    );
  }
}
