interface ISafe {
   function isSafe() public pure returns (bool _true);
   
}

contract Foo {

   function foo(address _addr) public {
      ISafe iSafe = ISafe(_addr);

      
      if (iSafe.isSafe()) {
          
      }
   }

}
