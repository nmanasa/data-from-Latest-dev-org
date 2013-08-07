public with sharing class accountSave {
	public Account accObj;
	public String displayName{get; set;}
	public id idVar;
	public accountSave()
	{
		idVar = ApexPages.CurrentPage().getParameters().get('id');
		accObj = [select Name, id from Account where id = :idVar];
		displayName = accObj.Name;
	}
	public pageReference saveRecord()
	{
		transient Account acc = [select name from Account where id = :idVar];
		acc.name = displayName;
		update acc;
		return null;
	}
}