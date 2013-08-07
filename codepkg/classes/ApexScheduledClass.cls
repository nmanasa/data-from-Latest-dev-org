//To schedule an Apex class to run at regular intervals, we create an Apex class that implements the Schedulable interface

global class ApexScheduledClass Implements Schedulable 
{
	// List to store the Account object records
	List<Account> acc = new List<Account>();
	
	//Schedulable interface contains one method that must be implemented
	global void execute(SchedulableContext sc) 
	{
		ApexScheduleMethod asm = new ApexScheduleMethod();
		//sendmail();  
	}
	
	global String TimeMethod()
	{
		ApexScheduledClass p = new ApexScheduledClass();
        String sch = '0 0 * * * ?';
        
        return system.schedule('One Time Pro', sch, p);
	}

}

/*
// TYPE THE BELOW CODE IN DEVELOPER CONSOLE, WHICH WILL CREATE SCHEDULER FOR US. 
		ApexScheduledClass p = new ApexScheduledClass();
        String sch = '0 0 * * * ?';
        system.schedule('One Time Pro', sch, p);
*/