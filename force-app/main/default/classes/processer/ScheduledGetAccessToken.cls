global class ScheduledGetAccessToken implements Schedulable, Database.AllowsCallouts {
  global void execute(SchedulableContext sc) {
    CalloutToPlaygroundUtil.getAccessToken();
  }
}
