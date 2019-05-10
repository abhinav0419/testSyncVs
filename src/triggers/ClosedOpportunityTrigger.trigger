trigger ClosedOpportunityTrigger on Opportunity (before insert,before update) {
	List<Task> taskList = new List<Task>();
    for(Opportunity opp : trigger.new){
        if(opp.stageName == 'Closed Won'){
            Task tt = new Task(whatId=opp.Id);
            tt.Subject = 'Follow Up Test Task';
            taskList.add(tt);
        }
    }
    insert taskList;
}