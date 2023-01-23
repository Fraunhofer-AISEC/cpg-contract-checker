pragma solidity 0.4.21;

contract Base {

    uint public dataA;
    bytes32 public dataB;

    function setAB(uint a, bytes32 b) public {
        dataA = a;
        dataB = b;
    }

    function getA() public view returns(uint) {
        return dataA ;
    }

    function getB() public view returns(bytes32) {
        return dataB ;
    }

}

contract Extra {

   Base base;

   function Extra() public {
       base = new Base();
   }

   ...
}
