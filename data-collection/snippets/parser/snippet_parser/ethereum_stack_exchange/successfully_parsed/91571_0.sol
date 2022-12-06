function getDynamicUintArray() public pure returns (uint[] memory) {
        uint[] memory array = new uint[](3);
        array[0] = 1;
        array[1] = 2;
        array[2] = 3;
        return array;
    }
