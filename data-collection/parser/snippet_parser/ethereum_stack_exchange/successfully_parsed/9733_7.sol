contract A {
   
   function f1(bool arg1, uint arg2) returns(uint) {
       if (arg1) {
           throw;
       } else {
           return arg2;
       }
   }
}
