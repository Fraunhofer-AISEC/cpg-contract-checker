
pragma solidity 0.8.13;
    
contract Array {
    string[] public myArray;

    function fillArrayMemory(string memory _word) public {
        myArray.push(_word);
    }
    
}
