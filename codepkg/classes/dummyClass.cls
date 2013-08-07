public with sharing class dummyClass {
	public List<Account> AccountsTable{get; set;}
	public List<wrappClass> wrapperList{get; set;}
	public List<wrappClass> getAccounts()
	{
	//	AccountsTable = new List<Account>();
		AccountsTable = [select name, AccountNumber, Phone from Account limit 5];
		for(Account a: AccountsTable)
		wrapperList.add(new wrappClass(a));
		return wrapperList;
		
	}
	public class wrappClass
	{
		public Account accObj{get; set;}
		public Boolean status{get; set;}
		wrappClass(Account a)
		{
			accObj = a;
			status = false;
		}
	}

}