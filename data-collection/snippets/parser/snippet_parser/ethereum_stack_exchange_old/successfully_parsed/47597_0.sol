pragma solidity ^0.4.21;

import "openzeppelin-solidity/contracts/math/SafeMath.sol";





contract BasicWithdrawable {
  using SafeMath for uint;

  mapping (address => uint) private balances;

  

  function balanceOf(address _user) public view returns(uint _balance) {
    return balances[_user];
  }

  

  function() public payable {
    deposit();
  }

  function deposit() public payable {
    _increaseBalance(msg.sender, msg.value);
  }

  function transfer(address _to, uint _amount) public {
    require(_amount <= balances[msg.sender]);

    _decreaseBalance(msg.sender, _amount);
    _increaseBalance(_to, _amount);
  }

  function withdrawAll() public {
    require(balances[msg.sender] > 0);

    
    uint _amount = balances[msg.sender];
    _decreaseBalance(msg.sender, _amount);
    msg.sender.transfer(_amount);
  }

  function withdraw(uint _amount) public {
    require(_amount <= balances[msg.sender]);

    _decreaseBalance(msg.sender, _amount);
    msg.sender.transfer(_amount);
  }

  

  
  
  function depositTo(address _user, uint _amount) internal {
    require(_user != address(0));
    _increaseBalance(_user, _amount);
  }

  

  function _increaseBalance(address _user, uint _amount) private {
    balances[_user] = balances[_user].add(_amount);
  }

  function _decreaseBalance(address _user, uint _amount) private {
    balances[_user] = balances[_user].sub(_amount);
  }
}
