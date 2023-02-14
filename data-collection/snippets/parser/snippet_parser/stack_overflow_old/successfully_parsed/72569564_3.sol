
pragma solidity 0.8.13;
    
contract Array {

    function fillArrayMemory() public {
        string[] memory _array = new string[](2);
        _array[0] = "test";
        _array[1] = "test1";
    }
    
}
