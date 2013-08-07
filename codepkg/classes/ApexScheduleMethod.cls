public with sharing class ApexScheduleMethod {    
	
	List<Account> acc = new List<Account>();
	public List<String> strList { get;set; } 
	public String customLabelValue = Label.Object_Label;
	public Map<String, Schema.SObjectField> objectFields;
		public ApexScheduleMethod()
		{
			
			//Map<String, Schema.SObjectField> objectFields = Schema.getGlobalDescribe().get('Account').getDescribe().fields.getMap();
			// customLabelValue is a custom label for stroing th eobject name.
			objectFields = Schema.getGlobalDescribe().get(customLabelValue).getDescribe().fields.getMap();
			strList = new List<String>(objectFields.keySet());
			strList.sort();
			System.debug('strList = new List<String>(objectFields.keySet()); ===manasa===>'+strList);
			
		// Is for forming a query to retreive all the records from the account object	
		String table = '';
		String queryString = 'select ' ;
		for(Integer j = 0; j<strList.size();j++)
		{
			queryString+= strList[j];  
			queryString+= ',';  
			table+= strList[j]; 
			table+= ',';
		}
		table+= '\n';
		queryString = queryString.removeEnd(',');
		queryString+= ' from '+customLabelValue; 
		System.debug('queryString+ ====manasa=====>'+queryString);
		
		List<sObject> accountsList = new List<sObject>();
		accountsList = Database.query(queryString); 
		System.debug('accountsList = Database.query(queryString);  ====manasa=====>'+accountsList);
		
		
		// table is used to store the data, retreived from 'account' type list.
		// strList holds the field names
		for(sObject SO :accountsList)
		{
			for(String setElement : strList)
			{
				String tempstring = String.valueOf(SO.get(setElement));
			/*	if(tempstring<>null){
				tempstring = tempstring.replace(',','-');
				if(tempstring.contains('\n'))
				tempstring = null;
				}*/
				if(tempstring<>null){
					tempstring = tempstring.escapeCsv();
					if(tempstring.contains('\n'))
					{
					tempstring = '"'+tempstring+'"';
					tempstring = tempstring.unescapeCsv();
					}
					}
				
				else 
				tempstring = '';  
				table+= tempstring;
				table+= ',';
			} 
						table+= '\n'; 
		} 
	 
	//	System.debug('manasa============>'+table);  
		
		// Email attachments are Blob file types
		Blob b = Blob.valueof(table);   
		Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
		efa.setFileName('attachment.csv');
		efa.setBody(b);    
		
		              
		Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
		string [] toaddress= New string[]{'nama.manasa@gmail.com'};
		email.setSubject('Testing Apex Scheduler-Subject');
		email.setPlainTextBody('Please have a look at the attached document for account object records');
		email.setToAddresses(toaddress);
		
		// For adding attachments to the mail
		email.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});
		Messaging.sendEmail(New Messaging.SingleEmailMessage[]{email});
	}  

}