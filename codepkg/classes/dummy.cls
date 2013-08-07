public with sharing class dummy {
	public blob file1Content{get; set;}
	public blob file2Content{get; set;}
	public blob file3Content{get; set;}
	public String file1{get; set;}
	public String file2{get; set;}
	public String file3{get; set;}
	public boolean flag1{get; set;}
	public boolean flag2{get; set;}
	public boolean flag3{get; set;}
	public dummy()
	{
		flag1 = false;
		flag2 = false;
		flag3 = false;
		
	}
	public pageReference flag1Status()
	{
		flag1 = true;
		return null;
	}
	public pageReference flag2Status()
	{
		flag2 = true;
		return null;
	}
	public pageReference flag3Status()
	{
		flag3 = true;
		return null;
	}
	public pageReference uploadFunction()
	{
		Attachment a1 = new Attachment(name = file1, body = file1Content, parentId = '0019000000OxN1D');
		insert a1;
		Attachment a2 = new Attachment(name = file2, body = file2Content, parentId = '0019000000OxN1D');
		insert a2;
		Attachment a3 = new Attachment(name = file3, body = file3Content, parentId = '0019000000OxN1D');
		insert a3;
		return null;
	}
}