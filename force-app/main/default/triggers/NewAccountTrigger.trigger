trigger NewAccountTrigger on Account(after insert, after update) {
  new NewAccountTriggerHandler().run();
}
