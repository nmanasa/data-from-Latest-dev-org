public with sharing class ActionFunction_AC {
	public transient string accountName{get;set;}
	public transient boolean isEmpty {get;set;}
	public list<Account> accList{get;set;}
	{
		accList = new List<Account>();
	}
	public ActionFunction_AC(){
		isEMpty = false;
	}
	public pageReference methodOne(){
		accList.clear();
		accList = [select Id, Name from account where Name = :accountName limit 1];
		system.debug('******** Account List:'+accList+' Size of the list:'+accList.size());
		if(accList.size()>0){
			isEmpty = true;
			system.debug('******* True value');
		}
		else{
			isEmpty = false;
		}
		return null;
	}
}