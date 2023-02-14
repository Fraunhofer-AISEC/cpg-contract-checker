contract ServiceContract {
  FirstContract firstContract;
  address owner;

  constructor (address _firstContract,
        address _endorserContract) {
        firstContract = FirstContract(_firstContract);
        owner = msg.sender;
  }

  function receiveApproval(address _sender, uint256 _value,
        address _tokenContract, bytes data) public {

       bytes32 vacancyId = keccak256(data);
            
            firstContract.addVacancy(_sender, vacancyId, _value);
}
}