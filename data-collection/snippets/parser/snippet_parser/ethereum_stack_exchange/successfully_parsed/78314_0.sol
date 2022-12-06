function createContract() public payable {
   NewContract myNewContract = new NewContract();
   address newContractAddress = address(newContract);
   newContractAddress.transfer(msg.value);
}
