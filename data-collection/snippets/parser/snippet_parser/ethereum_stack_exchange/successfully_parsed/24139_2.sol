pragma solidity ^0.4.13;

contract test{

    bytes32 v ;

    function isEmpty() returns (bool flag){
        assembly {
            flag := eq(eq(sload(v_slot),0),1)
        }
    }
}
