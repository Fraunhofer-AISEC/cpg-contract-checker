pragma solidity 0.4.25;

contract A{ 

   address public owner;

   event Ret(string flag, address sender, address owner);
      event ConstrutEvt(string flag,  address owner );

   function A() public{
       owner = msg.sender;
       emit ConstrutEvt("A", msg.sender);
   }

   function doSomething()  public view returns(string flag, address sender, address owner){
            emit Ret("A::doSomething", msg.sender, owner);
            return ("A::doSomething", msg.sender, owner);
   }
}

contract EvilDoer{








    function doSomethingEvil(address instanceAddrOfA) public {
         A contractA = A(instanceAddrOfA);
         contractA.doSomething();  
    }    
}
