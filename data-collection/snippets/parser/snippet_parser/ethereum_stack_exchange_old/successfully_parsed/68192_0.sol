contract amountSplit {

  mapping(address => uint) public toAccountBalance;
  address[2] public beneficiaryList;

  event LogReceived(address sender, uint amount);
  function addAddresses(address addressOne, address addressTwo) {
    beneficiaryList[0]=addressOne;
    beneficiaryList[1]=addressTwo;
  }

  function pay(uint amount) public payable returns(bool success)
  {
    if(amount==0) throw;
    uint forth = amount / 2;

    toAccountBalance[beneficiaryList[0]] += forth;
    toAccountBalance[beneficiaryList[1]] += forth;
    emit LogReceived(msg.sender, msg.value);
    return true;
  }
}
