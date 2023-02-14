
pragma solidity ^0.8.10;

contract typeCasting{

    

    function bytesToString(bytes memory _data) public pure returns (string memory) {
        string memory result = string(_data);
        return result;
    }
}
