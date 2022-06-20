contract BOLData {

    string public SData;
    string public SCData;


    function BOLData(string S_Data) 
    { 
        SData= S_Data;
        SCData= '';
    } 
    function getSData() constant returns (string retVal) 
    { 
        return SData;
    }
    function setSCData(string SC_Data) 
    { 
        SCData = SC_Data; 
    } 
    function getSCData() constant returns (string retVal) 
    { 
        return SCData;
    }

}
