/**
 * @File Name          : AccountManager.cls
 * @Description        : 
 * @Author             : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 5/10/2019, 9:43:28 AM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    5/9/2019, 4:01:38 PM   ChangeMeIn@UserSettingsUnder.SFDoc     Initial Version
**/
@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
	@HttpGet
    global static Account getAccount(){
        RestRequest req = RestContext.request;
        String accId = req.requestURI.substringBetween('Accounts/', '/contacts');
        Account acc = [SELECT Id, Name, (SELECT Id, Name FROM Contacts)
                       FROM Account WHERE Id = :accId];
        return acc;
        //testing testBranch 2 feature
    }
}