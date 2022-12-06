contract BOLData{
struct Data {
    string sData;
    string ssCompanyData;
    string ConsigneeData;
    string BOL_ID;
}

mapping(string => Data) private BOL_Data;

function BOLData (string s_Data, string  bolid)
{
    BOL_Data[bolid] = Data(s_Data,'', '', bolid);
}

function addData(string ssCompany_Data, string Consignee_Data, string bolid) public {
    string s_DataO = BOL_Data[bolid].sData;
    string ssCompany_DataO = BOL_Data[bolid].ssCompanyData;
    string Consignee_DataO = BOL_Data[bolid].ConsigneeData;
    if(ssCompany_DataO == '')
    {}
    BOL_Data[bolid] = Data(s_DataO,ssCompany_Data, Consignee_Data, bolid);
}


function getData(string DataID) returns (string, string, string){
    string s_Data = BOL_Data[DataID].sData;
    string ssCompany_Data = BOL_Data[DataID].ssCompanyData;
    string Consignee_Data = BOL_Data[DataID].ConsigneeData;
    return(s_Data, ssCompany_Data, Consignee_Data);
}
}