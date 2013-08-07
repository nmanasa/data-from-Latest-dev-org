public with sharing class searchAccount {
    public List<Account> accVar{get; set;}
    public String inputValue{get; set;}
    public pageReference searchFunction()
    {
        accVar = [select name, id from Account where name like  :'%'+ inputValue +'%'];              
        return null;
    }
}