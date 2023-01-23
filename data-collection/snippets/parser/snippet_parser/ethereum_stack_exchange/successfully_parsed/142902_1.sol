

pragma solidity ^0.8.0;

contract StringComparison {

    string public a = "test";

    
   function compareStrings(string memory b) public view returns (bool) {
    return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))));
}
}
