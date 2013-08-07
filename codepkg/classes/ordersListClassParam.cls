public with sharing class ordersListClassParam {

        List<Order__c> listobj = new List<Order__c>();
       public  List<Items__c> sublistobj{get;set;}
        public id retreiveId {get; set;}
        public boolean flagvar {get; set;}
        public ordersListClassParam()
        {
            sublistobj = new List<Items__c>();
            flagvar = false;
        }
        
        public List<Order__c> getItemsDisplay()
        {
                listobj = [select id,Name, Date_of_Order__c, Total_Bill__c from Order__c];
                return listobj;
        }
        
        public PageReference ChildsDisplay() {
        sublistobj = [select Name, Cost_of_the_Item__c, Number_of_items__c from Items__C where Order__c = :retreiveId];
        if(sublistobj.size()!=0)
        flagvar = true;
        else 
        {
            flagvar = false;
             ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'No Child records exists'));
        }
        return null;
        }
           
}