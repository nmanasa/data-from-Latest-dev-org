public with sharing class GroupUsersAddition{
    public List<SelectOption> listValues{get; set;}
    public List<Group> groupList{get; set;}
    public List<SelectOption> groupListString{get; set;}
//  public List<User> userList{get; set;}
    public String selectedGroup{get; set;}
    public id groupIdVar{get; set;}
    public Set<SelectOption> secondPickList{get; set;}
    public List<GroupMember> groupMemberVar = new List<GroupMember>(); 
    public Set<String> leftPicklist{get; set;}
    public Set<String> rightPicklist{get; set;}
    public Set<String> tempPicklist{get; set;}
    public GroupUsersAddition ()
    {
        leftPicklist = new Set<String>();
        rightPicklist = new Set<String>();
        List<User> tempUserList = new List<User>();
        listValues = new List<SelectOption>();
        tempUserList = [select name from User];
        for(User u:tempUserList)
        listValues.add(new SelectOption(u.name,u.name));
        secondPickList = new Set<SelectOption>();
        tempPicklist = new Set<String>();
    //  userList = new List<User>();
        groupList = new List<Group>();
        groupListString = new List<SelectOption>();
        groupList = [select name from group];
        for(Group g: groupList)
            if(g.name <> null)
            groupListString.add(new SelectOption(g.name,g.name));
    }
    public pageReference testFunc()
    {
        secondPickList.clear();
        List<User> userSubList = new List<User>();
        System.debug('Manasa===============>'+selectedGroup);
        groupIdVar = [select id from Group where name = :selectedGroup ].id;
        groupMemberVar = [select GroupId, UserOrGroupId from GroupMember where GroupId = :groupIdVar ];
        List<id> userIdVar = new List<id>();
        for(GroupMember g: groupMemberVar)
        {
            userIdVar.add(g.UserOrGroupId);
                        
        }
        System.debug('Manasa=====userIdVar====>'+userIdVar);    
            
        for(id idVar: userIdVar)
        {
    //  userSubList = [select name from user where id = :idVar];
        userSubList.add([select name from user where id = :idVar]);
        System.debug('Manasa========='+userSubList);
        }
        System.debug('Manasa========='+userSubList);
        for(user u:userSubList)
             secondPickList.add(new SelectOption(u.name,u.name));
             System.debug('Manasa===secondPickList====>'+secondPickList);
        return null;
    }
    
    public pageReference leftButtonFunc()
    {
        leftPicklist.addAll(tempPicklist);
        return null;
    }
    public pageReference rightButtonFunc()
    {
        return null;
    }
}