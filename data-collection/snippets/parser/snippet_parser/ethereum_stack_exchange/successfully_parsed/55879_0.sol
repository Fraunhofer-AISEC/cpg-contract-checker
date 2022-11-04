pragma solidity ^0.4.24;


contract Mikancoin {
  uint public totalSupply;
  uint8 public decimals = 3;
  mapping (address => uint) public balanceOf;

  constructor(uint _initialSupply) public {
    totalSupply = _initialSupply * 10 ** uint(decimals);
    balanceOf[msg.sender] = totalSupply;
  }

  function transfer(address _to, uint _tokens) public returns (bool success) {
    
    balanceOf[msg.sender] -= _tokens;
    balanceOf[_to] += _tokens;
    return true;
  }

  function balanceOf(address _tokenOwner) public view returns (uint balance) {
    return balanceOf[_tokenOwner];
  }
}
