abstract contract AbstractContract is Time {
    constructor(uint256 valueA, uint256 valueB, uint256 valueC) Time(valueA) {}
}

contract A is AbstractContract {
    constructor(uint256 valueA, uint256 valueB, uint256 valueC) 
      public
      AbstractContract(valueA, valueB, valueC) {}
}

contract B is AbstractContract {
}

contract Factory {

   function createA(uint256 valueA, uint256 valueB, uint256 valueC) {
     A a = new A(valueA, valueB, valueC)    
   }

   function createB(uint256 valueA, uint256 valueB, uint256 valueC) {
     B b = new B(valueA, valueB, valueC)    
   }
}
