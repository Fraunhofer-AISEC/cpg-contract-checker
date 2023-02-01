contract B {
     
     address addrA;
     receive() public payable {
        require(msg.sender ==addrA, "Error- Sender not allowed");
        
     }


    function setAddressA(address _addrA) public onlyOwner{ addrA = _addrA;}
}

contract A{
     
   address b;
   ...

   constructor(address payable _b) public { 
       b =_b; 
   }
   receive() payable external{
      ...
      b.transfer(msg.value);
   }
}
