public class testemail
{
    private final Contact con;
    public testemail(ApexPages.StandardController controller)
    {
        system.debug('Manasa====>'+controller);
        this.con=(Contact)controller.getRecord();
        system.debug('Manasa====>'+con);
    }
    
    
    public void SendEmail()
    {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        //mail.setTargetObjectId(con.Id);
        mail.setTargetObjectId(con.Id);
        mail.setTemplateId('00X90000001AMCN');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] 
        { mail }
        );
    }
}