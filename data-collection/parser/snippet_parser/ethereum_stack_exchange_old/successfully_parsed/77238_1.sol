pragma solidity ^0.5.0;

contract Test {

    struct MyStruct {
        uint256 x;
        uint256 y;
    }

    function testFunc() public pure returns (uint, uint) {
        MyStruct memory data1 = MyStruct(5,7);
        return myFunc(data1);
    }

    function myFunc(MyStruct memory data) internal pure returns (uint256 _z, uint _w) {
        assembly {
            _z := mload(data)
            _w := mload(add(data,0x20))
        }
    }
}
