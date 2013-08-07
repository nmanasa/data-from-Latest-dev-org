public class chartOpportunity {
	public static List<opportunity> oppVar = new List<Opportunity>();
    
    public chartOpportunity()
    {    	
    	oppVar = [select CloseDate, Amount from Opportunity limit 8];
    }
    // Return a list of data points for a chart
    public List<Data> getData() {
    	List<Data> dataList = new List<Data>();
    	for(Integer i = 0; i< oppVar.size(); i++)
    	dataList.add(new Data((oppVar[i].CloseDate).month(),Integer.valueOf(oppVar[i].Amount))); 
    	System.debug('Manasa==>'+dataList);
    	return dataList;
    }
    // Wrapper class
    public class Data {
        public Integer cDateVar { get; set; }
        public Integer amountVar { get; set; }
        
        public Data(Integer cDateVar, Integer amountVar) {
            this.cDateVar = cDateVar;
            this.amountVar = amountVar;
            
        }
    }
}