public with sharing class accountAttachment {
	public String accName{get; set;}
	public String email{get; set;}
	public blob attachment{get; set;}
	public String fileName{get; set;}
	public boolean flag;
	public String selectValue{get;set;}
	public List<SelectOption> pickListValues{get;set;}
	public List<Account> accList = new List<Account>();
	public List<Attachment> attList{get;set;}
	public List<Attachment> attListString{get;set;}
	Account accObj = new Account();
	
	// For adding picklist values from 1 to 10
	public accountAttachment()
	{
		accName = '';
		selectValue = '';
		flag = false;
		attListString = new List<Attachment>();
		attList = new List<Attachment>();
		pickListValues = new List<SelectOption>();
		for(Integer i = 1; i<11; i++)
			pickListValues.add(new SelectOption(''+i,''+i));
	}
	// For Saving Files through the VF Pages into the attchment related list of the given Parent id(Record id)
	public pageReference uploadFunc()
	{
		if(accName == '' || accName == null)
		ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Account Name is a Required Field'));
		else
		{			
			id idVar;
			flag = false;
			accList = [select Name, Industry, Email__c from Account ];
			for(Integer i = 0; i < accList.size(); i++)
			{
				if( accList[i].name == accName )
				{
					idVar = [Select id from Account where name = :accName ].id;	
					flag = true;
				}
				
			}
			if(flag == false)
				{
					Account accVar = new Account();
					accVar.Name = accName;
					accVar.email__c = email;					
					insert accVar;					
					idVar = accVar.id; 	
				}
			attListString.clear();
			if(attList.size() > 0 )
			{
				for(Attachment a: attList)
				{
					if(a.name != '' && a.name != null && a.body != null)
					attListString.add(new Attachment(name = a.name, body = a.body, parentId = idVar));
				}
				if(attListString.size() != 0)
				insert attListString;
			}
			else
            ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.ERROR,'Please select at-least one file'));	
		
			
		}
		return null;
	}
	public pageReference displayFunc()
	{
		attList = new List<Attachment>();
		for(Integer i = 0; i< Integer.ValueOf(selectValue); i++)
		attList.add(new Attachment());
		return null;
	}

}