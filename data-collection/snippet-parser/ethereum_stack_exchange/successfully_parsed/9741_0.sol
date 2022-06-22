contract A {  
   int private x;          
   function save(int _x) {
       x = _x;
   }
   function get() returns (int) {
       return x;
   }
}

contract B {    
   A private a;    
   function B(address _a) {
       a = A(_a);
   }    
   function doStuff() {
       a.save(42);
   }
   function getStuff()  returns (int) {
       return a.get();
   }
}

contract C {
   B private b;    
   function C(address _b) {
       b = B(_b);
   }
   function calculateTheMeaning() {
      b.doStuff();
   }
   function getTheAnswer() returns (int) {
      return b.getStuff();
   }
}
