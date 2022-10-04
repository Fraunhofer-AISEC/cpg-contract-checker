... more contract here 

  mapping(address => address) ownerToDataProvider;

  function foo(address _account) external {
    ownerToDataProvider[msg.sender] = _account;
  }

  function bar() external view returns(address) {
    return ownerToDataProvider[msg.sender];
  }

... more contract here 
