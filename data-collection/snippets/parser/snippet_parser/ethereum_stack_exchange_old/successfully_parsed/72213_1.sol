pragma solidity 0.4.25;

contract MyContract {
    function read1() external pure returns (uint a, uint b, uint c) {
        uint[3] memory arr;
        arr[0] = 111;
        arr[1] = 222;
        arr[2] = 333;
        assembly {
            a := mload(add(arr,  0))
            b := mload(add(arr, 32))
            c := mload(add(arr, 64))
        }
    }

    function read2() external pure returns (uint a, uint b, uint c) {
        uint[] memory arr = new uint[](3);
        arr[0] = 444;
        arr[1] = 555;
        arr[2] = 666;
        assembly {
            a := mload(add(arr,  0))
            b := mload(add(arr, 32))
            c := mload(add(arr, 64))
        }
    }
}
