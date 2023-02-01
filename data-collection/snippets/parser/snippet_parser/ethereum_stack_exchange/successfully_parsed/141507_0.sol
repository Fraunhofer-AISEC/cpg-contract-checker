constructor() payable {
    owner = msg.sender;
  }
function deposit(address _seller) external payable returns(bytes32) {

   require(msg.value > 0.1 ether, "Value of the deposit must be more than 0.1 ether"); 
}
