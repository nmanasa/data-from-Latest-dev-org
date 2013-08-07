public with sharing class itemsListClass {
        
        Items__c itemobj = new Items__c();
        List<Items__c> listobj = new List<Items__c>();
        
        public List<Items__c> getItemsDisplay()
        {
                listobj = [select Name, Number_of_items__c, Amount__c, Cost_of_the_Item__c, Order__c from Items__c];
                return listobj;
        }

}