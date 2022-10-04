contract Factory {
  address[] newContracts;

  function createContract(uint num) {
    address newContract = new Contract(num);
    newContracts.push(newContract);
  }

  function getContract() view public returns(address[]) {
    return newContracts;
  }

  function getNum(address _add) view public returns(uint) {
    return Contract(_add).getNum();
  }
}


contract Contract {
  uint public Num;

  function Contract(uint num) {
    Num = num;
  }

  function getNum() public returns(uint) {
    return Num;
  }
}
