pragma solidity ^0.4.11;


contract Ownable {

 address public owner;

    
  function Ownable() {
    owner = msg.sender;
  }


  
  modifier onlyOwner() {
    (msg.sender == owner);
    _;
  }


  
  function transferOwnership(address newOwner) onlyOwner {
   (newOwner != address(0));      
    owner = newOwner;
  }

}


contract Destructible is Ownable {

  function Destructible() payable { } 

  
  function destroy() onlyOwner {
    selfdestruct(owner);
  }

  function destroyAndSend(address _recipient) onlyOwner {
    selfdestruct(_recipient);
  }
}

contract BankAccount is Ownable, Destructible {

  function store() public payable {

  } 

  function withdraw(uint amount) public onlyOwner {
      if (this.balance >= amount) {
       msg.sender.transfer(amount);
     }
  } 
 }
