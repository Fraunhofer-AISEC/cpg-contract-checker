pragma solidity >=0.8.12 <0.9.0;

contract Test {
    int[] staticArray = [int(1), int(2), int(3), int(4), int(5)];

    function getStaticArray(int _pos) public view returns(int) {
        int ret = staticArray[_pos];
        return ret;
    }
}
