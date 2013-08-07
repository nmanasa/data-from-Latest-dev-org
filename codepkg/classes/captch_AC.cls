public with sharing class captch_AC {
	public Integer c=0;
	public string getcaptcha(){
		String s;
		String captch;
		List<String> alphabet = new List<String>();
		alphabet.add('a');
		Map<String,String> alpha = new Map<String, String>();
		alpha.put('0','0');
		alpha.put('1','1');
		alpha.put('2','2');
		alpha.put('3','3');
		alpha.put('4','4');
		alpha.put('5','5');
		alpha.put('6','6');
		alpha.put('7','7');
		alpha.put('8','8');
		alpha.put('9','9');
		alpha.put('10','a');
		alpha.put('11','b');
		alpha.put('12','c');
		alpha.put('13','d');
		alpha.put('14','e');
		alpha.put('15','f');
		alpha.put('16','g');
		alpha.put('17','h');
		alpha.put('18','i');
		alpha.put('19','j');
		alpha.put('20','k');
		alpha.put('21','l');
		alpha.put('22','m');
		alpha.put('23','n');
		alpha.put('24','o');
		alpha.put('25','p');
		alpha.put('26','q');
		alpha.put('27','r');
		alpha.put('28','s');
		alpha.put('29','t');
		alpha.put('30','u');
		alpha.put('31','v');
		alpha.put('32','w');
		alpha.put('33','x');
		alpha.put('34','y');
		alpha.put('35','z');
		alpha.put('36','A');
		alpha.put('37','B');
		alpha.put('38','C');
		alpha.put('39','D');
		alpha.put('40','E');
		alpha.put('41','F');
		alpha.put('42','G');
		alpha.put('43','H');
		alpha.put('44','I');
		alpha.put('45','J');
		alpha.put('46','K');
		alpha.put('47','L');
		alpha.put('48','M');
		alpha.put('49','N');
		alpha.put('50','O');
		alpha.put('51','P');
		alpha.put('52','Q');
		alpha.put('53','R');
		alpha.put('54','S');
		alpha.put('55','T');
		alpha.put('56','U');
		alpha.put('57','V');
		alpha.put('58','W');
		alpha.put('59','X');
		alpha.put('60','Y');
		alpha.put('61','Z');
		
		for(Integer i=0;i<6;i++)
		{	
			Integer d;
			if(math.mod(math.abs(c),2)==0)
			{
				do
				{
					d = math.abs(math.round(math.random()* 100));
				}while(d<62 && d>9);
				
			}
			else
			{
				do
				{
					d = math.abs(math.round(math.random()* 100));
				}while(d<10 || d>61);
			}	
			if(d>61)
			d = math.mod(d,10);
			s = alpha.get(String.valueOf(d));
			if(captch==null)
			captch = s;
			else
			{
				if(captch.containsAny(s))
					{
						c--;
						i--;
						if(i<0)
						i=0;
					}
				else
					captch = captch+s;
			}
			c++;
		}
		return captch;
	}
	public void refresh()
	{
		if(math.mod(c,2)==0)
			c=1;
		else c=0;
		getcaptcha();
	}
	public pageReference submit()
	{
		pageReference pr = new pageReference('https://ap1.salesforce.com');
		return pr;
	}
	public string input
	{
		get; set;
	}
}