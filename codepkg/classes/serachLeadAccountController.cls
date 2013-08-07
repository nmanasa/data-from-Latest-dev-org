public with sharing class serachLeadAccountController {
	public String firstName{get; set;}
	public String lastName{get; set;}
	public String email{get; set;}
	public String phone{get; set;}
	public List<lead> leadList{get; set;}
	public List<lead> accountList{get; set;}
	public boolean createLead{get; set;}
	public boolean showlist{get;set;}
	public serachLeadAccountController()
	{
		createLead = false;
		showlist = false;
	}
	public pageReference creatingLead()
	{
		lead leadObj = new lead();
		leadObj.FirstName = firstName;
		leadObj.LastName = lastName;
		leadObj.Email = email;
		leadObj.Company = '360vantage';
		leadObj.Phone = phone;
		insert leadObj;
		return null;
	}
	public pageReference searchFunction()
	{
		if(firstName == '' && lastName == '' && email == '' && phone == '')
		{
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please enter atleast one value'));
		}
		else
		{
			
		leadList = [select firstName,LastName, Phone, Email, Status from lead
		 where (firstName like : firstName+ '%' AND LastName like :lastName+'%'
		  AND Email like :email+'%' AND phone like :phone+'%')];
		  //if(firstName == '' AND lastName == '' AND email == '' AND phone == '')
		  if(leadList.size() < 1)
		  {
		  	ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Record Not Found, you can create a new Lead'));
		  	createLead = true;
		  	showlist = false;
		  }
		  else
		  {
		  	createLead = false;
		  	showlist = true;
		  }
		}  
		
		
		return null;
	}
	
}