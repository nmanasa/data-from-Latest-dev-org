public with sharing class popUpRecord {
	
	public boolean displayPopUp{get; set;}
	public id retreiveId{get; set;}
	public Items__c selectedRecord{get; set;}
	
	public Order__c orderList{get; set;}
        
        Items__c itemobj = new Items__c();
        List<Items__c> listobj = new List<Items__c>();
        List<Items__c> requiredList = new List<Items__c>();
        public  popUpRecord()
        {
        	
        }
        public List<Items__c> getItemsDisplay()
        {
                listobj = [select Name, Number_of_items__c, Amount__c, Cost_of_the_Item__c, Order__c from Items__c];
                return listobj;
        }
         public void closePopup() {        
        displayPopup = false;    
	    }     
	   
        
        public pageReference resultPage()
        {
        	displayPopup = true;
        	getSelectedRecord();
        	return null;
        }
        public List<Items__c> getSelectedRecord()
        {
        	
        	requiredList = [select id,Name, Number_of_items__c,Order__c, Cost_of_the_Item__c, Amount__c from Items__c where id = :retreiveId];
        	selectedRecord = requiredList[0];
        	System.debug('Manasa============>'+selectedRecord.Order__c);
     
        	orderList = [select name from Order__c where id = :requiredList[0].Order__c];
        	return requiredList;
        }

}