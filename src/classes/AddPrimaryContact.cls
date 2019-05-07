public class AddPrimaryContact implements Queueable {
    Contact cntt;
    String abbr;
    public AddPrimaryContact(Contact cnt, String abr){
        cntt = cnt;
        abbr = abr;
    }
    
    public void execute(QueueableContext  context){
        List<Contact> cntList = new List<Contact>();
        List<Account> acctList = [SELECT Id,Name,BillingState,(Select Id,Firstname,LastName from Contacts)  FROM Account WHERE BillingState =: abbr LIMIT 200];
        for(Account acc : acctList){
            Contact c = cntt.clone(false,false,false,false);
            c.AccountId = acc.Id;
            cntList.add(c);
        }
        if(cntList.size() > 0){
          insert cntList;  
        }
        
    }
}