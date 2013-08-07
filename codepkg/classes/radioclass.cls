public with sharing class radioclass {
    String value = null;
    public String fname { get; set; }
    public String lname{ get; set; }
    public String zcode{ get; set; }
    public String selectedValue{ get; set; }
    boolean flag =false;
    
     public boolean getFlag()
   {
       return flag;
   }
    
    public boolean radiovalues()
     {
        System.debug('Value1 is ==> '+selectedValue );
        if(value == 'FALSE')
             flag = false;
             else
             flag = true;
             return flag;
    } 
   
   public List<Selectoption> getdisplayValues()
   {
        List<SelectOption> options = new List<SelectOption> ();
        options.add(new SelectOption('TRUE','TRUE')); 
        options.add(new SelectOption('FALSE','FALSE')); 
        return options;
   }
   
   public String getSelectedValue() {
        return value;
    }
                    
    public void setSelectedValue(String value) { 
        this.value = value;
        }
   
    
}