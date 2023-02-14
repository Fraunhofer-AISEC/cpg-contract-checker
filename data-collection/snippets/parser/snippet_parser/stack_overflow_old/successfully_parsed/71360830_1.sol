pragma solidity ^0.8.12;

contract Test {
    uint[] public arr = [uint(1), 2, 3, 4, 5, 6, 7, 8 ,9];

    function isArrayEven() public view returns(bool[] memory) {
        bool[] memory ret = new bool[](arr.length);

        for (uint i = 0; i < arr.length; i++) {
            ret[i] = (arr[i]%2 == 0);
        }

        return ret;
    }
}
