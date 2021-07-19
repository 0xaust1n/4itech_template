public with sharing class NewAccountTriggerHandler extends TriggerHandler {
  private String url = 'https://4idps4-dev-ed.my.salesforce.com/services/apexrest/AccountsApi';

  public NewAccountTriggerHandler() {
  }

  protected override void afterInsert() {
    String stringBodyAsJson = JSON.serialize((List<Account>) Trigger.new);
    String method = 'POST';
    CalloutToPlaygroundUtil.createCallout(url, stringBodyAsJson);
  }

  protected override void afterUpdate() {
    String stringBodyAsJson = JSON.serialize((List<Account>) Trigger.new);
    String method = 'PUT';
    CalloutToPlaygroundUtil.updateCallout(url, stringBodyAsJson);
  }
}
