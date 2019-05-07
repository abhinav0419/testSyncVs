@isTest
public class LeadProcessorTest {
    @isTest static void leadTest(){
        List<Lead> ldList = new List<Lead>();
        for(Integer i=0; i<10;i++){
            Lead l = new Lead();
            l.FirstName = 'test'+i;
            l.LastName = 'test'+i;
            l.Company = 'comp'+i;
            ldList.add(l);
        }
        insert ldList;
        Test.startTest();
        LeadProcessor objLead = new LeadProcessor();
        Database.executeBatch(objLead);
        Test.stoptest();
        List<Lead> lddLst = [SELECT id,LeadSource FROM Lead WHERE LeadSource = 'Dreamforce'];
    	System.assertEquals(10, lddLst.size());
    }
    
}