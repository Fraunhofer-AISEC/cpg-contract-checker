functionName(data){
    uint _amount;
    address _receiver;
    address _tokenLeadContract;
    uint _expectedAmount;
    address _expectedSC;
    (_amount, _receiver, _tokenLeadContract, _expectedAmount, _expectedSC) = abi.decode(data, (uint, address, address, uint, address));
 }
