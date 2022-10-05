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

   function getBaseAddres() public view returns(address) {
       return address(base);
   }

   function baseGetA() public view returns(uint) {
        return base.getA();
   }

   function baseGetB() public view returns(bytes32) {
       return base.getB();
   }

   function baseSetAB(uint a, bytes32 b) public returns(bool success) {
       base.setAB(a,b);
       return true;
   }
}
