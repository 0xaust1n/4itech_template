public class MessageResponseWithDataWrapper {
  public String success;
  public Message message;
  public Object data;

  public class Message {
    public String code;
    public String content;
  }
}
