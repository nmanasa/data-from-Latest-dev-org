public with sharing class addRemoveUsers 
{
	public List<User> userList{get; set;}
	public List<selectOption> optionList{get; set;}
	public List<String> firstPick{get; set;}
	public List<selectOption> userPickList1{get; set;}
	public Set<String> lefttotalList{get; set;}
	public Set<String> righttotalList{get; set;}
	public List<String> secondPick{get; set;}
	public List<selectOption> groupsList{get; set;}
	public List<Group> groupValues{get;set;}
	
	
	public addRemoveUsers()
	{
		secondPick = new List<String>();
		userPickList1 = new List<selectOption>();
		lefttotalList = new Set<String>();
		righttotalList = new Set<String>();
	    groupValues = new List<Group>();
		userList = new List<User>();
		optionList = new List<selectOption>();
		userList = [select name from user];
		groupsList = new List<selectOption>();
		groupValues = [select name from Group];
		for(Group g: groupValues )
		{
			if(g.name <> null)
			groupsList.add(new selectOption(g.name,g.name));
		}
			
		for(User u: userList) 
		{
			lefttotalList.add(u.name);
			optionList.add(new selectOption(u.name,u.name));
		}
	}
	public PageReference selectclick()
	{
		optionList.clear();
		userPickList1.clear();
	//	lefttotalList.clear();
		for(String s: firstPick)
		{
			lefttotalList.remove(s);
			righttotalList.add(s);
		}
			
		for(String s: lefttotalList)
			optionList.add(new selectOption(s,s)); 
		for(String s: righttotalList)
		{		
			userPickList1.add(new SelectOption(s,s));
			
		}
		return null;
	}
	public PageReference  removeclick()
	{
		optionList.clear();
		userPickList1.clear();
	//	lefttotalList.clear();
		for(String s: secondPick)
		{
			righttotalList.remove(s);
			lefttotalList.add(s);
		}
		for(String s : righttotalList)
			userPickList1.add(new selectOption(s,s));
		for(String s: lefttotalList)
			optionList.add(new selectOption(s,s));
		return null;
	}
}