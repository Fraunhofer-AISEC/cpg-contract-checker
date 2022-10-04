pragma solidity 0.6.8;

contract Concatenation {

    string public base64Data;

    function concat(string memory pieceOfData) external returns (string memory) {
        base64Data = string(abi.encodePacked(base64Data, pieceOfData));
        return base64Data;
    }

}
