public with sharing class wordController {
    public String fname{get; set;}
    public String lname{get; set;}
    public String rnum{get; set;}
    public integer incrementValue{get;set;}
    public wordDocument__c result{get; set;}
  //  public wordDocument__c wd;
    public String imageURL{get;set;}
    public String strValue{get; set;}
    public DocumentObject__c dObject{get; set;}
    DocumentObject__c docObjectVar;
/*    public wordController()
    {
    	incrementValue = '';
    }   */
 
    public pageReference requirdFieldsVerification()
    {
     /*   if((fname == null || fname == '') || (lname == null || lname == '') || (rnum == null || rnum == ''))
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Required Fields are Missing')); */
            result = [select City__c, Company_Name__c, Description__c, Pin__c, State__c from wordDocument__c where Name = :rnum];
           try{
           		docObjectVar = [select Name,DocNumber__c from DocumentObject__c limit 1];
           }
           catch(Exception e){
           	
           }
           
            if (docObjectVar == null)
            {
            	docObjectVar = new DocumentObject__c(name = 'First', DocNumber__c = 1);
            	incrementValue = 1;
            	insert docObjectVar;
            }
            else
            {
         	docObjectVar.DocNumber__c+= 1;
         	update docObjectVar;
            incrementValue = Integer.valueOf(docObjectVar.DocNumber__c);
            } 
            
            
            
          /*  incrementValue = Integer.ValueOf(Label.Global_Value);
           incrementValue =  incrementValue+1;
           strValue = String.ValueOf(incrementValue);
            System.debug('Manasa============>'+Label.Global_Value); */
         //   string.format(System.Label.Global_Value, new string[] {'My value', 'Account Name'});
        // string.format(Label.Global_Value, new string(incrementValue));
 /*   string.format(Label.Global_Value,new string[]{'Honey','Choclate'});
            imageURL='/servlet/servlet.FileDownload?file=';
            List< document > documentList=[select name from document where 
                                            Name='Fish_image'];
           
            if(documentList.size()>0)
            {
              imageURL=imageURL+documentList[0].id;
            }
            
          //  Label.Global_Value = String.ValueOf(incrementValue); */
          PageReference ReturnPage = new PageReference('/apex/resultWordPage');        
        ReturnPage.setRedirect(false);
        return ReturnPage; 
        
        return  null;
    }
}