@isTest
public class AddPrimaryContactTest {
    @isTest static void addPrimaryContactTest(){
        List<Account> acctList = new List<Account>();
        for(integer i =0 ; i< 50 ;i++){
            acctList.add(new Account(BillingState = 'NY', name = 'Test'+i));
        }
        for(integer i=0; i<50; i++){
            acctList.add(new Account(BillingState = 'CA', name ='TestTest'+i));
        }
        insert acctList;
        Contact c = new Contact();
        c.FirstName = 'Demmm';
        c.LastName = 'Demm';
        insert c;
        String str = 'CA';
        AddPrimaryContact obj = new AddPrimaryContact(c,str);
        Test.startTest();
        System.enqueueJob(obj);
        Test.stopTest();
        List<Account> actll = [SELECT Id, BillingState, (SELECT Id FROM Contacts) FROM ACCOUNT WHERE BillingState =: 'CA'];
        System.assertEquals(50,actll[0].Contacts.size());
    }
}