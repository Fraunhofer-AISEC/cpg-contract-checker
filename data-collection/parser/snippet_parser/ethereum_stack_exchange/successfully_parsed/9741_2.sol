contract A {  
   int private x;          
   function save(int _x) {
       x = _x;
   }
   function get() returns (int) {
       return x;
   }
}

import "A.sol";
contract B {    
   A private a;    
   function B() {
       a = new A();
   }    
   function doStuff() {
       a.save(42);
   }
   function getStuff()  returns (int) {
       return a.get();
   }
}

import "B.sol";
contract C {
   B private b;    
   function C() {
       b = new B();
   }
   function calculateTheMeaning() {
      b.doStuff();
   }
   function getTheAnswer() returns (int) {
      return b.getStuff();
   }
}
