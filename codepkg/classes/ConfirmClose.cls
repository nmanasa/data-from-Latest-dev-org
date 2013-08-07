public with sharing class ConfirmClose {
	public list<Case> PQListVar{get;set;}
	public id caseId{get;set;}
	public id accId{get;set;}
	public ConfirmClose(ApexPages.StandardController stdController)
	{
		caseId = ApexPages.currentPage().getParameters().get('Id');
		accId = [select id,accountId from Case where id = :caseId].accountId;
	}
	public List<Case> getPQList()
	{
	
		PQListVar = [select CaseNumber,Notes__c,Next_Call_Time__c, Subject, Type,status, ownerid from case where accountId = :accId];
		return PQListVar;
	}
	public pageReference saveRecord()
	{
		
		update 	PQListVar;
		return null;
	}

}