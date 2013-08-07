public with sharing class editDeleteClass {
    List<editWrapperClass> correspondingRecord = new List<editWrapperClass>();
    List<Items__c> itemsList = new List<Items__c>();
    public Boolean flag{get;set;}
    public id retreiveId{get; set;}
    public id editId {get; set;}
    public editDeleteClass()
    {
       
    }
   
    public List<editWrapperClass> getWrapperMethod()
    {
            correspondingRecord.clear();
          for(Items__c item: [select id, Name, Amount__c, Cost_of_the_Item__c, Number_of_items__c, Order__c from Items__c])        
            correspondingRecord.add(new editWrapperClass(item));
            return correspondingRecord;        
    }
     public pageReference DeleteFunction()
    {
        System.debug('Before debug retrieveID===================='+retreiveId);
        List<Items__c> itemObj = [Select id, Name from Items__c where id = :retreiveId];
       
        if(itemObj.size()<>0)
        {
        System.debug('After debug');
        delete itemObj;
        }
        return null;
        
    }
    public pageReference editFunction()
    {
        System.debug('id=======================>'+editId );
        for(editWrapperClass ew: correspondingRecord)
        {
            if(ew.itemWrapVar.id == editId)
            ew.boolWrapVar = true;
        }
        return null;
    }
    public pageReference getSaveRecord()  
    {
    	update itemsList;
    	return null;
    }  
    
    public class editWrapperClass
    {
        public Items__c itemWrapVar{get; set;}
        public Boolean boolWrapVar{get;set;}
        public editWrapperClass(Items__c itm)
        {
            itemWrapVar = itm;
            boolWrapVar = false;
        } 
    } 

}