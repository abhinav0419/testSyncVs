trigger AccTriggerLogic on Account (after update) {
    if(trigger.isUpdate){
        Set<Id> accIdsToBeUpdated = new Set<Id>();
        for(Id idAccount : trigger.newMap.keyset()){
            accIdsToBeUpdated.add(idAccount);
        }
        List<Contact> cntUpdated = new List<Contact>();
        List<Account> acclist = [SELECT Id,phone, (SELECT Id, Phone  FROM CONTACTS) FROM ACCOUNT WHERE id IN : accIdsToBeUpdated];
        for(Contact con : accList[0].Contacts){            
            con.phone = accList[0].phone;
            cntUpdated.add(con);
        }
        update cntUpdated;
    }
}