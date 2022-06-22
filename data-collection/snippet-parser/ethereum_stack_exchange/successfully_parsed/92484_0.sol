
library C {
   function a() public returns (uint) {
      return 15;
   }
}

contract A { 
    
   function a() public returns (uint) {
      return C.a();
   }
  
}
