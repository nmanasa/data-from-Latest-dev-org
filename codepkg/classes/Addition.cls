global class Addition implements Process.Plugin
{
    global Process.PluginResult invoke(Process.PluginRequest request)
    {
        Double X = (Double)request.inputParameters.get('X');
        Double Y = (Double)request.inputParameters.get('Y');
        // in addition to to adding the calculation below, to use this in the Visual Workflow Workbook, tutorial #3,
        // a third input called "Rate" will need to be defined for the calculate quote step: the screen input field "Interest_Rate".
        Double Z = (Double)request.inputParameters.get('Z');
       // Double monthlyrate = rate/(12*100);
     //   Double cMonthlyPayment = amount * (monthlyrate/(1 - Math.pow(1 + monthlyrate, -term)));
     Double cSUM=X+Y+Z;
        Map<String, Object> result = new Map<String, Object>();
        result.put('SUM', cSUM);
        return new Process.PluginResult(result);
    }
    global Process.PluginDescribeResult describe()
    {
        Process.PluginDescribeResult result = new Process.PluginDescribeResult();
        result.description='Addition of three numbers.';
        result.tag='Addition';
        result.inputParameters = new List<Process.PluginDescribeResult.InputParameter> 
    {
            new Process.PluginDescribeResult.InputParameter('X',
                Process.PluginDescribeResult.ParameterType.DOUBLE, true),
            new Process.PluginDescribeResult.InputParameter('Y',
                Process.PluginDescribeResult.ParameterType.DOUBLE, true),
            new Process.PluginDescribeResult.InputParameter('Z',
                Process.PluginDescribeResult.ParameterType.DOUBLE, true)
            };
        result.outputParameters = new List<Process.PluginDescribeResult.OutputParameter> {
            new Process.PluginDescribeResult.OutputParameter('SUM',
                Process.PluginDescribeResult.ParameterType.DOUBLE)
        };
        return result;
    }
   
}