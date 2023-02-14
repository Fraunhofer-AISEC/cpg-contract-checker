import "Owned.sol";

contract A is Owned {

   B private b;

   function A(address B) {
       b = B(b);
   }

   function myInterface() public onlyOwner {
       a.doStuff({from: msg.sender});
   }
}

contract B is Owned {

   C private c;

   function B(address c) {
       c = C(c);
   }

   function doStuff() public onlyOwner {
       c.store(42,{from: msg.sender});
   }
}

contract C is Owned {

   int private theAnswer;

   function store(int value) public onlyOwner {
       theAnswer = value
   }
}
