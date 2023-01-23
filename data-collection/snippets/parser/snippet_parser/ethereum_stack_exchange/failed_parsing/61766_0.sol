

mapping (bytes32 => myStruct) public myStructs;

Struct myStruct {
  uint256 a;
  uint256 b;
  uint256 c;
}



interface I_A {
  function myStructs(bytes32) returns (uint, uint, uint) public;
}
contract B {
  A a;
  constructor(address a_address) { a = I_A(a) };

  function exb(bytes32 _structaddr){
    
    a.myStructs(_structaddr); 
  }
}


import {A} from "./contracts/A.sol";
import {B} from "./contractsB.sol";

contract TestB {
  B testb;
  A testa;

   function beforeAll() {
     testa = new A();
     testB = new B(testa);
   }

  function test_exb() {
    b.exb();
  }
}
