public with sharing class searching {
    public String fname{get; set;}
    public String lname{get; set;}
    List<Candidate__c> userlistvar = new List<Candidate__c>();  //  public void UserList{get; set;}
    public void searchfunction()
    {
        getUserList();
    }
    
    public List<Candidate__c> getUserList()
    {
        if((fname!= null && fname!= '') || (lname!= null && lname!= ''))
        {
        userlistvar = [select First_Name__c,Last_Name__c,Em_ail__c from Candidate__c where(First_Name__c like :fname+'%' AND Last_Name__c like :lname+'%')];
         return userlistvar; 
         }
         else
         return null;
    } 
}