struct data{
    uint256 serialNum;
    address ownerAddress; er
    string ownerName;
    string id; 
    string name; 
    uint256 point;
    uint256 category;
    string description; 
    bool isOpen;
    bool isUsed;
}
function getDataInf(uint256 _serialNum) public view returns(data memory){
    data memory res = Dataset[_serialNum];
    return res;
}
