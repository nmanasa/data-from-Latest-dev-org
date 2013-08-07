public with sharing class emailClass
{
    public void SendEmail()
    {
        List<Account> accList = new List<Account>();
        accList = [Select id,name from account limit 20];
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        string [] toaddress= New string[]{'nama.manasa@gmail.com', 'mnama@360vantage.com'};
        email.setSubject('Testing Apex Scheduler-Subject');
        email.setPlainTextBody('Testing Apex Scheduler-Body=====>'+ accList);
        email.setToAddresses(toaddress);
        Messaging.sendEmail(New Messaging.SingleEmailMessage[]{email});
    }
}