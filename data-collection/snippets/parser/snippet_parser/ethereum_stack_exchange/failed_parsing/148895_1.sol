contract A{
   function receive() public {
      
      
   }
}

contract B{
   A a = 0x....address of A...

   function b1() public {
       
       address(a).call{value:1000}("");
       
   }
}
