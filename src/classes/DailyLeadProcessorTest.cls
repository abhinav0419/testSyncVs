@isTest
public class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 2 6 ? 2022';
    @isTest static void testScheduledJob() {
        List<Lead> leadsList= new List<Lead>();
       for (Integer i = 0; i < 200; i++) {
            leadsList.add(new lead(
                LastName ='Test'+i,
                company = 'test'+i,
                LeadSource =''
            ));
        }
        insert leadsList;
          Test.startTest();
           String jobId = System.schedule('Update LeadSource to DreamForce', CRON_EXP, new DailyLeadProcessor());
		Test.stopTest();
        List<Lead> ll = [SELECT Id, LeadSource FROM Lead WHERE LeadSource =: 'Dreamforce'];
        System.assertEquals(200,ll.size(),'lead size do not match');
    }      
       
}