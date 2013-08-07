public with sharing class repeatClass {
    public List<account> accountFunc{get;set;}
    public repeatClass(ApexPages.StandardController controller) {
        accountFunc = [select name from account];
    }

}