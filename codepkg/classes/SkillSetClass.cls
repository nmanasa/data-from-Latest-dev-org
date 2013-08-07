public with sharing class SkillSetClass {
	public List<SkillSet__c> skillList{get; set;}
	
	public List<SkillSet__c> getTableDisplay()
	{
		skillList = [select Date__c, Employee__c, C__c, Salesforce__c, Presentation_Skills__c, Communication_Skills__c from  SkillSet__c];
		return skillList;
	}

}