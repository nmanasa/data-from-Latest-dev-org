// Code retreive all custom objects in your org 

public class objectList{
    public String val {get;set;}
    
  /*  public List<SelectOption> getName(){        
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();
        System.debug('List of Values Manasa====gd=====>'+gd);          
        List<SelectOption> options = new List<SelectOption>();
        for(Schema.SObjectType f : gd){
            if (f.getDescribe().getName().contains('__c'))
            options.add(new SelectOption(f.getDescribe().getLabel(),f.getDescribe().getLabel()));             
        }
        return options;
    }*/
    
     public List<SelectOption> getName(){        
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();
        System.debug('List of Values Manasa====gd=====>'+gd);          
        List<SelectOption> options = new List<SelectOption>();
        for(Schema.SObjectType f : gd){
          //  if (f.getDescribe().getName().contains('__c'))
            options.add(new SelectOption(f.getDescribe().getLabel(),f.getDescribe().getLabel()));             
        }
        return options;
     }
    
}