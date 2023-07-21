contract SimpleUpgrade {
  address public implementation;
  address public admin;
  string public words;

  constructor(address _implementation) {
    admin = msg.sender;
    implementation = _implementation;
  }

  fallback() external payable {
    (bool success, bytes memory data) = implementation.delegatecall(msg.data);
  }

  function upgrade(address newImplementation) external {
    require(msg.sender == admin);
    implementation = newImplementation;
  }
}

contract Logic1 {
  address public implementation;
  address public admin;
  string public words;

  function overrideWords() public {
    words = 'old';
  }

  function getWords() public view returns (string memory) {
    return words;
  }
}
