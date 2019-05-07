@isTest
private class MaintenaceRequestTest {

    @isTest static void maintenanceRequestTestMethod() {
    	List<Case> caseList = new List<Case>();
        Work_Part__c prod = new Work_Part__c();
        prod.Name = 'testProd';
        prod.Maintenance_Cycle__c = 365;
        //insert prod;
        //System.assertEquals(1, [SELECT count() FROM Work_Part__c WHERE Name = 'testProd']);
        
        for(Integer i=1;i<=300;i++) {
            Case caseNew = new Case();
            caseNew.Subject = 'Maintenance';
            caseNew.Type = 'Other';
            caseNew.Status = 'New';
            caseNew.Product__c = prod.Id;
            caseList.add(caseNew);   
        }
        
        Test.startTest();
        
        insert caseList;
        System.assertEquals(300, [SELECT count() FROM Case WHERE Type = 'Other']);
        
        for(Case a : caseList){
            a.Type = 'Repair';
            a.Status = 'Closed';
        }
		update caseList;
        System.assertEquals(300, [SELECT count() FROM Case WHERE Type = 'Repair']);
        
        Test.stopTest();
        
    }
}