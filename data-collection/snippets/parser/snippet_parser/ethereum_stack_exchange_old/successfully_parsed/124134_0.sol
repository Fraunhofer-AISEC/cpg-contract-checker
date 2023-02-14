pragma solidity ^0.8.0;

contract Assembly {
  
    bool private var1 = true;
    bool private var2 = false;
    uint8 private var3 = 8;


    function getThirdVariable() public view returns(uint8 res, uint8 res2, uint8 res3, uint8 res4) {
        assembly {
            res := var3.slot
            res2 := var3.offset
            res3 := sload(var3.slot)
            res4 := sload(var3.offset)
        }
    }
}
