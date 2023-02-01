contract A {
  address public owner;
  function A() public {
      owner = msg.sender;
  }

  isOwner(address _addr) {
      return _addr == owner;
  }
}

contract Base is A { 
     ....
     someMethod(address _addr) {
        require(isOwner(msg.sender))

        
     }
}

contract SomeContract{
     Base public baseContract;
     function SomeContract(Base _base) { 
        baseContract = _base
     }
     callingMethod() {
        ....
        require(baseContract.someMethod(msg.sender))
        ....
     }
}
