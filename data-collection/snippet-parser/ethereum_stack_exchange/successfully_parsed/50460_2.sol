library TestLibrary {
    function setMyArray(uint[] storage value1, uint[] storage value2) internal {
        value1[0] = value2[0];
    }
}

contract Test {
    uint[] public arr;
    uint[] public arr1;

    constructor() public {
        arr = [1];
        arr1 = [2];
    }

    function setMe() public {
        TestLibrary.setMyArray(arr, arr1);
    }
}
