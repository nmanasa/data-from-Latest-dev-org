public with sharing class Quarters {
public Date dateVar{get; set;}
public List<SelectOption> QuarterVar{get; set;}
public List<Integer> intQuarter{get; set;}
	public Quarters()
	{
		QuarterVar = new List<selectOption>();
		intQuarter = new List<Integer>{1,2,3,4};
		
	//	System.debug('Manasa=======>'+);
	}
	public pageReference checkFunc()
	{
		Date dt = dateVar;
		Integer monthVar = dt.month();
		if(monthVar == 1 || monthVar == 2 || monthVar == 3 )
		{
			QuarterVar.clear();
			QuarterVar.add(new SelectOption('Q'+intQuarter[2],'Q'+intQuarter[2]));
			QuarterVar.add(new SelectOption('Q4','Q4'));
			QuarterVar.add(new SelectOption('Q3','Q3'));
			QuarterVar.add(new SelectOption('Q2','Q2')); 
		}
		
		else if(monthVar == 4 || monthVar == 5 || monthVar == 6 )
		{
			QuarterVar.clear();
			QuarterVar.add(new SelectOption('Q2','Q2'));
			QuarterVar.add(new SelectOption('Q1','Q1'));
			QuarterVar.add(new SelectOption('Q4','Q4'));
			QuarterVar.add(new SelectOption('Q3','Q3'));
		}
	
		else if(monthVar == 7 || monthVar == 8 || monthVar == 9 )
		{
			QuarterVar.clear();
			QuarterVar.add(new SelectOption('Q3','Q3'));
			QuarterVar.add(new SelectOption('Q2','Q2'));
			QuarterVar.add(new SelectOption('Q1','Q3'));
			QuarterVar.add(new SelectOption('Q4','Q4'));
		}
		
		else 
		{
			QuarterVar.clear();
			QuarterVar.add(new SelectOption('Q4','Q4'));
			QuarterVar.add(new SelectOption('Q3','Q3'));
			QuarterVar.add(new SelectOption('Q2','Q2'));
			QuarterVar.add(new SelectOption('Q1','Q1'));
		}
	
		return null;
	}
}