public class TestingController {
      @AuraEnabled
      public static List < Test_Object__c > getTestingData() {
        return [SELECT Id, Name, NNN__c FROM Test_Object__c ];
      }
    }