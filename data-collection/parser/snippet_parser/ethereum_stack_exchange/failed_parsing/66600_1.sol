Swap(_data){
     uint256 _amount;
     address _receiver;
     address _tokenLeadContract;
     uint256 _expectedAmount;
     address _expectedSC;

     (_amount, _receiver, _tokenLeadContract, _expectedAmount, _expectedSC) = decode(_data);

}
