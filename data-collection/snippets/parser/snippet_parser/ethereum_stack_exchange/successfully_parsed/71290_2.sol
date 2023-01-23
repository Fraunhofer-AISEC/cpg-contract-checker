pragma solidity 0.5.2;

contract A {

   uint public bidValue;
   address public bidder;

   function bid() public payable {
     bidValue = msg.value;    
     bidder = msg.sender;
   }
}

contract B {    

  function aBid(address aAddress) public payable{
    A a = A(aAddress);    
    a.bid.value(msg.value)();
  }
}
