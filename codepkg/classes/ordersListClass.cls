public with sharing class ordersListClass {

    public String getChildsDisplay() {
        return null;
    }


        List<Order__c> listobj = new List<Order__c>();
       public  List<Items__c> sublistobj{get;set;}
        public id retreiveId {get; set;}
        public boolean flag {get; set;}
        public ordersListClass()
        {
            sublistobj = new List<Items__c>();
        }
        
        public List<Order__c> getItemsDisplay()
        {
                listobj = [select id,Name, Date_of_Order__c, Total_Bill__c from Order__c];
                return listobj;
        }
        public pageReference ChildsDisplay()
        {
            sublistobj = [select Name, Cost_of_the_Item__c, Number_of_items__c from Items__C where Order__c = :retreiveId];
            return null;
        } 
        
        
}