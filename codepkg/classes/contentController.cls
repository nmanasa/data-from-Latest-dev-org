public class contentController {

    public blob file { get; set; }
    
    public PageReference go() {
        ContentVersion v = new ContentVersion();
        v.versionData = file;
        v.title = 'from VF';
        v.pathOnClient ='/foo.txt';
        insert v;
        return new PageReference('/' + v.id);
    }
}