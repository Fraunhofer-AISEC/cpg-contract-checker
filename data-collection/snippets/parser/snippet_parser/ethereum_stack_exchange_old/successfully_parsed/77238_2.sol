pragma solidity ^0.5.0;

contract Test {

    struct MyStruct {
        Point x;
        Point y;
    } 

    struct Point {
        uint256 x;
        uint256 y;
    }

    function testFunc() public pure returns (uint256, uint256, uint256, uint256) {
        MyStruct memory data1 = MyStruct(Point(3,5), Point(7,9));
        return myFunc(data1);
    }

    function myFunc(MyStruct memory data) internal pure returns (uint256 _x, uint256 _y, uint256 _u, uint256 _v) {
        assembly {

            let first_point := mload(data)
            _x := mload(first_point)
            _y := mload(add(first_point,0x20))

            let second_point := mload(add(data,0x20))
            _u := mload(second_point)
            _v := mload(add(second_point,0x20))

            
        }
    }
}
