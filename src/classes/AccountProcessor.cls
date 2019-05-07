global class AccountProcessor {

    @future
    public static void countContacts(List<Id> acctIdsList){
    List<Account> acctList = new List<Account>();
    List<Account> accList = [Select id,Number_of_Contacts__c, (SELECT id FROM Contacts) FROM Account WHERE id in: acctIdsList];
        for(Account acc : accList){
            acc.Number_of_Contacts__c = acc.Contacts.size();
            acctList.add(acc);
        }
        update acctList;
    }
}