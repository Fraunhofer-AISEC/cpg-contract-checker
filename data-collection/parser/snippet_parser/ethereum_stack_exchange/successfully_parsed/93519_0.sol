    pragma solidity 0.4.25;

    contract Bank
    {
     string app_name = "";
     int status = 0;
     string invoiceNumber = "000000000";
     string receiptNumber = "000000000";
     int balanceDue = 0;
     int depositAmt = 0;
     int officeId = 0;  
    string owner_address = "";
    string tenant_address = "";
    int timestamp = 0;
    int stageNumber = 0;
    string water_rate = "";
    string water_cons= "";
    string elec_rate= "";
    string elec_cons= "";
    string band_rate= "";
    string band_cons= "";


constructor()public
{
    app_name = "Future Estate";
}  

 function startSession(int _officeId,int _timestamp, string _waterRate, string _waterCons, string _elecRate, string _electCons,  string _bandRate, string _bandCons) public
{
    stageNumber = 2;
    officeId = _officeId;
    timestamp = _timestamp;
    water_rate = _waterRate;
    water_cons = _waterCons;
    elec_rate = _elecRate;   
    elec_cons = _electCons;
    band_rate = _bandRate;
    band_cons = _bandCons;
}

function sendDeposit(int _officeId,int _deposit,string _owner_address,string _tenant_address) public 
{
    officeId = _officeId;
    depositAmt = _deposit;
    stageNumber = 1;
    owner_address= _owner_address;
    tenant_address = _tenant_address;
    
    
}



function endSession( int _officeId, int32 _timestamp,string _waterRate, string _waterCons, string _elecRate, string _electCons, string _bandRate, string _bandCons,string _invoiceNo, string _receiptNo) public
{
    stageNumber = 3;
    officeId = _officeId;
    timestamp = _timestamp;
    water_rate = _waterRate;
    water_cons = _waterCons;
    elec_rate = _elecRate;
    elec_cons = _electCons;
    band_rate = _bandRate;
    band_cons = _bandCons;
    invoiceNumber = _invoiceNo;
    receiptNumber = _receiptNo;
    
}

function settlePayment(int _officeId, int32 _timestamp,int32 _serviceCost) public 
{
    stageNumber = 4;
    officeId = _officeId;
    timestamp = _timestamp;
    balanceDue = _serviceCost - balanceDue;
    
}


}   
