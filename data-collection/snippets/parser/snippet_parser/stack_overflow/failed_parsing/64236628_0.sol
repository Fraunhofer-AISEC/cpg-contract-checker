pragma ^0.7.2

contract simple {
  address owner;

  constructor() public {
    
  }

  modifier() {
    require(
      owner == msg.sender,
      'No sufficient right'
    )
  }

  function setOwner() ownerOnly external {
     owner = msg.sender;
  }
}
