global class ScheduledGetAccessToken implements Schedulable {
  global void execute(SchedulableContext sc) {
    ID jobID = System.enqueueJob(new QueueableGetAccessToken());
  }
}
