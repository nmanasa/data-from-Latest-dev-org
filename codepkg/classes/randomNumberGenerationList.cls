public with sharing class randomNumberGenerationList {
    public Decimal randValue{get; set;}
//  public integer reqIntValue{get; set;}
    public Set<Integer> setValues{get;set;}
    public List<Integer> intListValues{get; set;}
    public List<Integer> copyListValues{get; set;}
    public Integer firstValue{get; set;}
    public Integer SecondValue{get; set;}
    public Integer thirdValue{get; set;}
    public Integer fourthValue{get; set;}
    public Integer fifthValue{get; set;}
    public Integer sixthValue{get; set;}
    public Integer seventhValue{get; set;}
    public Integer eighthValue{get; set;}
    public Integer ninethValue{get; set;}
    public Integer tenthValue{get; set;}
    public randomNumberGenerationList()
    {
    
    }
    public pageReference genFunc()
    {
        setValues = new Set<Integer>();
        intListValues = new List<Integer>();
        copyListValues = new List<Integer>();
        Map<Integer,Integer> ListVal=new Map<Integer,Integer>();
        while(setValues.size() < 10)
        {
            randValue = math.random()*10;
            setValues.add(Integer.valueOf(randValue));
        //  intListValues.add(Integer.valueOf(randValue));
            if(!ListVal.containsKey(Integer.valueOf(randValue))){
                ListVal.put(Integer.valueOf(randValue),Integer.valueOf(randValue));
            }
        }
  /*      for(Integer i = 0; i<copyListValues.size(); i++)
        System.debug('Manasa======>'+ copyListValues.get(i)); */
         System.debug('Manasa======>'+ ListVal);
       
        System.debug('Manasa====>'+copyListValues);
        firstValue = ListVal.get(0);
        SecondValue = ListVal.get(1);
        thirdValue = ListVal.get(2);
        fourthValue = ListVal.get(3);
        fifthValue = ListVal.get(4);
        sixthValue = ListVal.get(5);
        seventhValue = ListVal.get(6);
        eighthValue = ListVal.get(7);
        ninethValue = ListVal.get(8);
        tenthValue = ListVal.get(9);
    //  firstValue = copyListValues.get(10);
        return null;
    }
}