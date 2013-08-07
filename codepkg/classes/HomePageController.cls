public with sharing class HomePageController {
	public String message{get; set;}
	public profile profileIdValue{get;set;}
	MessagesStore__c msgInstance = new MessagesStore__c();
	public List<MessagesStore__c> classMessageList{get; set;}
	
	public HomePageController()
	{
		getTableDisplay();
	}
	public pageReference messageAdd()
	{
		MessagesStore__c msgInstance = new MessagesStore__c();
		if (message<> '' && message <> null)	
		{	
		msgInstance.MessageText__c = message;
		insert msgInstance;
		}
		return null;
	}
	
	public List<MessagesStore__c> getTableDisplay()
	{
		classMessageList = [select id,MessageText__c from MessagesStore__c];
		return classMessageList;
	}
	public boolean getProfileValue()
	{
		profileIdValue = [select id from profile WHERE Id = :Userinfo.getProfileId() limit 1];
		if(profileIdValue.id == '00e900000010aZV' )
		return true;
		else
		return false;
	}
	
}