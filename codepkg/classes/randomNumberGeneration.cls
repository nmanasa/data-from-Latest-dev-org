public with sharing class randomNumberGeneration {
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
    public randomNumberGeneration()
    {
    
    }
    public pageReference genFunc()
    {
        setValues = new Set<Integer>();
        intListValues = new List<Integer>();
        copyListValues = new List<Integer>();
        Integer c = 0;
        while(setValues.size() < 10)
        {
            randValue = math.random()*10;
            setValues.add(Integer.valueOf(randValue));
            if(setValues.size()==c+1){
            c++;
            copyListValues.add(Integer.valueOf(randValue));
            }
        }
       
        firstValue = copyListValues.get(0);
        SecondValue = copyListValues.get(1);
        thirdValue = copyListValues.get(2);
        fourthValue = copyListValues.get(3);
        fifthValue = copyListValues.get(4);
        sixthValue = copyListValues.get(5);
        seventhValue = copyListValues.get(6);
        eighthValue = copyListValues.get(7);
        ninethValue = copyListValues.get(8);
        tenthValue = copyListValues.get(9);
    //  firstValue = copyListValues.get(10);
        return null;
    }
}