public with sharing class MaintenanceRequestHelper {
    public static void updateWorkOrders(Map<Id,Case> applicableCases){
    	//Variables for product and cases.
    	Map<Id,Integer> mapProduct = new Map<Id,Integer>();
    	List<Case> newCases = new List<Case>();
    	
    	//Product list having Id and maintenance cycle value. 
    	List<Work_Part__c> listProduct = [SELECT Id, Maintenance_Cycle__c FROM Work_Part__c];
    	for(Work_Part__c p : listProduct){
    		if(p != null){
    			if(p.Maintenance_Cycle__c != null){
    				mapProduct.put(p.Id,Integer.valueOf(p.Maintenance_Cycle__c));
    			}
    		}
    	}
    	
    	//For Every Case update the values and request for maintenance
    	for(Case aCase : applicableCases.values()){
    		Case newCase = new Case();
    		newCase.Vehicle__c = aCase.Vehicle__c;
    		newCase.Type = 'Routine Maintenance';
            newCase.Subject = String.isBlank(aCase.Subject) ? 'Routine Maintenance Request' : aCase.Subject;
            newCase.Date_Reported__c = Date.today();
            newCase.Status = 'New';
            newCase.Product__c = aCase.Product__c;
            newCase.Due_Date__c =  (mapProduct.get(aCase.Id) != null) ? (Date.today().addDays(Integer.valueOf(mapProduct.get(aCase.Id)))) : (Date.today());
            newCases.add(newCase);
    	}
    	if(newCases.size() > 0){
    		insert newCases;
    	}
    }
}