public with sharing class positionClass {
	public Position__c pvar = new Position__c();
	public List<Position__c> pos{get;set;}
	public List<Position__c> tempList{get;set;}
	public positionClass(ApexPages.StandardController stdController)
	{
		 
		 System.debug('pvar:'+pvar);
	}
	public list<Position__c> getPositionList()
	{
		pos = [select id, Name, Job_Description__c, Job_Status__c, Location__c from Position__c limit 2];
		
		return pos;
	}
	public pageReference SaveRecord()
	{
		update 	pos;
		return null;
	}
}