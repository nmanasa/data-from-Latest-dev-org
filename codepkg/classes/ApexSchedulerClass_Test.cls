@isTest
public class ApexSchedulerClass_Test {
    public static testMethod void scheduleMetod()
	{
		ApexScheduleMethod schvar = new ApexScheduleMethod(); 
		schvar.customLabelValue='test'; 
		schvar.objectFields = Schema.getGlobalDescribe().get(schvar.customLabelValue).getDescribe().fields.getMap();
	}

}