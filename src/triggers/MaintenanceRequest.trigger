trigger MaintenanceRequest on Case (after update, before update) {
    Map<Id,Case> applicableCases = new Map<Id,Case>();
    if(Trigger.isUpdate){
    	if(Trigger.isAfter){
    		for(Case aCase : Trigger.new){
    			if(aCase.Status == 'Closed' && (aCase.Type.equals('Repair') || aCase.Type.equals('Routine Maintanence'))){
    				applicableCases.put(aCase.Id,aCase);
    			}
    		}
    		MaintenanceRequestHelper.updateWorkOrders(applicableCases);
    	}
    }
}