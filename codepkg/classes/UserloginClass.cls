public with sharing class UserloginClass
{
    public String username{get;set;}
    public String password{get;set;}
    public String url;
    public UserloginClass()
    {
        url = '/apex/welcomePage';
    }
    public pageReference checkFunc()
    {
 //   System.debug('Manasa===>'+username);
 //   System.debug('Manasa===>'+password);
        List<UserDetails__c> userList = [select Username__c,  Password__c from UserDetails__c];
           System.debug('Manasa==candList=>'+userList);
        for(UserDetails__c u: userList )
        {
            if(u.Username__c == username && (u.Password__c != password && Password != '')  )          
            	ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'The Password you eneterd is incorrect'));
            	else if(u.Username__c == username && u.Password__c == password)
            	{
            	PageReference acctPage = new PageReference(url);
		        acctPage.setRedirect(true);
		        return acctPage;
            	}
            	else if(username == '' || password == '')
            	ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Please fill the below fields'));
            	else if(u.username__c != username )
            	ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'The Credentials you eneterd are incorrect')); 
        }
        
        return null;
    }
    
}