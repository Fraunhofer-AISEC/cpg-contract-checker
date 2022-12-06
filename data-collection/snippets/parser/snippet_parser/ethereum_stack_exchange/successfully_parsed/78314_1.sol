function createContract() public payable {
   NewContract myNewContract = new NewContract();
   address payable newContractAddress = address(newContract);
   newContractAddress.transfer(msg.value);
}
