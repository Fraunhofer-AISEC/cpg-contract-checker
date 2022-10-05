pragma solidity ^0.4.21;

contract Loop {
    uint[] array = [1, 2, 3, 4, 5];

    function returnNthElement(uint _index) returns (uint) {
        assembly {
            let index := _index
            let length := mload(sload(array_slot))
            for
               { let i := 0 }
               lt(i, length)
               { i := add(i, 1)}
           {
               
           }
        }
    }
}
