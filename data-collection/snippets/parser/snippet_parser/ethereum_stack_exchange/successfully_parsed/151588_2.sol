contract MyContract {
  address public owner;
  address public alice;
  address public bob;
  bool public approved;
   constructor(address _alice, address _bob) {
    owner = msg.sender;
    alice = _alice;
    bob = _bob;
  }
   modifier onlyApproved() {
    require(msg.sender == bob && approved, "Function can only be executed by Bob after approval from Alice");
    _;
  }
   function F() public onlyApproved {
    
  }
   function approve() public {
    require(msg.sender == alice, "Approval can only be given by Alice");
    approved = true;
  }
}
