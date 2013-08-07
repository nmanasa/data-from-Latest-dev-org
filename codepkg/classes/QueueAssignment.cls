public with sharing class QueueAssignment {
	public List<Case> PQListVar{get;set;}
	public List<Case> manQueueList{get; set;}
	public id caseId{get;set;}
	public id accid{get;set;}
	
    public QueueAssignment()
	{
		caseId = ApexPages.currentPage().getParameters().get('Id');
    	accid = [select id,AccountId from case where Id= :caseId].AccountId;
	}
                       
	public List<Case> getPQList()
	{
	//	PQListVar = [select CaseNumber,accountid, Subject, Type from case where OwnerId = '00G90000001FDec'];
		PQListVar = [select CaseNumber,accountid, Subject, Type, ownerid from case where accountid = :accid  and ownerid = '00G90000001FDec'];
		return PQListVar;
	}
	public List<Case> getManQueue()
	{
		manQueueList = [select CaseNumber,accountid, Subject, Type, ownerid from case where accountid = :accid  and ownerid <> '00G90000001FDec'];
		return manQueueList;
	}
}