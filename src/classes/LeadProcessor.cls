global class LeadProcessor implements Database.Batchable<SObject> {
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT LeadSource FROM LEAD]);
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        for(Lead l : scope){
            l.LeadSource = 'Dreamforce ';
        }
        update scope;
    }
    
    global void finish(Database.BatchableContext bc){
        
    }
}