

pragma solidity ^0.8.0;

contract StringsAndBytesByAI {
    function encodeStringList(string[] memory stringList) public pure returns (bytes memory) {
        return abi.encode(stringList);
    }

    function decodeStringList(bytes memory encodedList) public pure returns (string[] memory) {
        string[] memory decodedList = abi.decode(encodedList, (string[]));
        
        return decodedList;
    }
}
