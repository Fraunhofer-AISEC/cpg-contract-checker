contract A {
   address newContract;
   function createContract(uint a, string memory b, address c) public {
       newContract = new B(a, b, c);
   }
}
contract B {
   uint aa;
   string bb;
   address cc;
   constructor(uint a, string memory b, address c) public {
      aa=a;
      bb=b;
      cc=c;
   }
 }
