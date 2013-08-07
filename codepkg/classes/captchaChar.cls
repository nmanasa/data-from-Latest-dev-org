public with sharing class captchaChar {
    Integer intVar;
    String strVar = '';
    String result = '';
    String output = '';
    Map<String,String> mapobj;
    Set<String> setVar;
     public captchaChar()
    {
        mapobj = new Map<String,String>();
        setVar = new Set<String>();
        mapobj.put('1','a');
        mapobj.put('2','b');
        mapobj.put('3','c');
        mapobj.put('4','d');
        mapobj.put('5','e');
        mapobj.put('6','f');
        mapobj.put('7','g');
        mapobj.put('8','h');
        mapobj.put('9','i');
        mapobj.put('10','j');
        mapobj.put('11','k');
        mapobj.put('12','l');
        mapobj.put('13','m');
        mapobj.put('14','n');
        mapobj.put('15','o');
        mapobj.put('16','p');
        mapobj.put('17','q');
        mapobj.put('18','r');
        mapobj.put('19','s');
        mapobj.put('20','t');
        mapobj.put('21','u');
        mapobj.put('22','v');
        mapobj.put('23','w');
        mapobj.put('24','x');
        mapobj.put('25','y');
        mapobj.put('26','z');
        mapobj.put('27','A');
        mapobj.put('28','B');
        mapobj.put('29','C');
        mapobj.put('30','D');
        mapobj.put('31','E');
        mapobj.put('32','F');
        mapobj.put('33','G');
        mapobj.put('34','H');
        mapobj.put('35','I');
        mapobj.put('36','J');
        mapobj.put('37','K');
        mapobj.put('38','L');
        mapobj.put('39','M');
        mapobj.put('40','N');
        mapobj.put('41','O');
        mapobj.put('42','P');
        mapobj.put('43','Q');
        mapobj.put('44','R');
        mapobj.put('45','S');
        mapobj.put('46','T');
        mapobj.put('47','U');
        mapobj.put('48','V');
        mapobj.put('49','W');
        mapobj.put('50','X');
        mapobj.put('51','Y');
        mapobj.put('52','Z');
        mapobj.put('53','0');
        mapobj.put('54','1');
        mapobj.put('55','2');
        mapobj.put('56','3');
        mapobj.put('57','4');
        mapobj.put('58','5');
        mapobj.put('59','6');
        mapobj.put('60','7');
        mapobj.put('61','8');
        mapobj.put('62','9');       
    }
    
    //intVar = Math.Random();
    public pageReference refreshValues()
    {
    	getDisplayValue();
    	return null;
    }
    
    public String getDisplayValue()
    {       
        setVar.clear();
        output = '';
        for(Integer i = 0; i < 5; i++ )
        {
            intVar = Integer.ValueOf(Math.Random()*100);
            if(intVar> 62)
            intVar = math.MOD(intVar,62);
            result = String.valueOf(intVar);
            
            strVar= mapobj.get(result);
            setVar.add(strVar);
        }
       for(String str:setVar)
       	output+= str;
       	return output;
      //  return setVar;
    }
}