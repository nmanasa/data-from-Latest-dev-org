// This class is used to extract all the fields from all the objects present in your org

public class sobjectFields {

   public list<SelectOption> selectedobject { get; set; }

    public String objectName { get; set; }    
    public set<string> flds{get;set;}
    
    Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
    public sobjectFields(){
                   
                selectedobject = new list<SelectOption>();  
                  selectedobject.add(new selectoption('','-None-'));
                  list<schema.SobjectType> lst=schemaMap.values();
                  for(schema.SobjectType ss:lst){
                      selectedobject.add(new selectoption(ss.getDescribe().getLocalName(),ss.getDescribe().getLabel()));
                      selectedobject.sort();
               }
                 flds= new set<string>();
                  lsps=new list<SelectOption>();
    }
 
      
      public String fields { get; set; }
      
       public list<SelectOption> lsps{get;set;}
      
       public void function() {
       
         if(objectName!=null || objectName!=''){
             
                 lsps.clear();
         
           Map<string,Schema.SObjectField> mpConField=schemaMap.get(objectName).getDescribe().fields.getMap();
   /*        System.debug('schemaMap ===manasa===>'+schemaMap);
           System.debug('schemaMap.get(objectName)===manasa====>'+schemaMap.get(objectName));
           System.debug('schemaMap.get(objectName).getDescribe()===manasa====>'+schemaMap.get(objectName).getDescribe());
           System.debug('schemaMap.get(objectName).getDescribe().fields===manasa====>'+schemaMap.get(objectName).getDescribe().fields);
           System.debug('schemaMap.get(objectName).getDescribe().fields.getMap();====manasa===>'+schemaMap.get(objectName).getDescribe().fields.getMap());
           System.debug('Map<string,Schema.SObjectField> mpConField=schemaMap.get(objectName).getDescribe().fields.getMap();====manasa===>'+mpConField); */
               flds=mpConField.keySet(); 
               
               System.debug('flds=mpConField.keySet();===manasa====>'+flds);
                           
                   for(string name:flds){
                   Schema.DescribeFieldResult fldResult=mpConField.get(name).getDescribe();
                   System.debug('Schema.DescribeFieldResult fldResult=mpConField.get(name).getDescribe();==manasa====>'+fldResult);
                   if((fldResult.getName()).contains('__c'))
                    lsps.add(new SelectOption(fldResult.getLabel(),fldResult.getLabel()));
                    lsps.sort();       
                                      
                                  
                   } 
                   
                   
           /*        for(string name:flds){
                	     lsps.add(new SelectOption(name,name));
                    lsps.sort();    
                    } */
                   
                   
                   
                }        
    }
    
        

}