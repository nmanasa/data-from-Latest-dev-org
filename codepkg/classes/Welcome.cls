public with sharing class Welcome {
    public String firstname { get; set; }
    Form__c form = new Form__c();
    public void save()
    {
        form.First_Name__c = firstname;
        insert form;
    }
    
}