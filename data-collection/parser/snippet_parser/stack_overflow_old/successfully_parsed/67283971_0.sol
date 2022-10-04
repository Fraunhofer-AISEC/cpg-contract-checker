pragma solidity >=0.7.0 <0.9.0;

contract details {
    uint count=0;
   struct empDetails {
        uint date;
        string bank;
        uint BPay;
        uint allw;
        uint spallw;
        string status;
    }
    mapping (string => empDetails) AllDetails;


    function SetUserInfo(uint _date, string memory _empID, string memory _bank, string memory _status,
    uint _BPay, uint _allw, uint _spallw) public {
        AllDetails[_empID].date = _date;
        AllDetails[_empID].bank = _bank;
        AllDetails[_empID].BPay = _BPay;
        AllDetails[_empID].allw = _allw;
        AllDetails[_empID].spallw = _spallw;
        AllDetails[_empID].status = _status;
}


    function GetUserInfo(string memory _empID) public view returns (uint,string memory,uint,uint,uint,string memory)
    {
        return (AllDetails[_empID].date,AllDetails[_empID].bank,AllDetails[_empID].BPay, AllDetails[_empID].allw,
        AllDetails[_empID].spallw,AllDetails[_empID].status);
    }

}
