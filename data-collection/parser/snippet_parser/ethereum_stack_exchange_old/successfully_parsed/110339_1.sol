
pragma solidity ^0.8.0;

contract strings {
    
    function string_tobytes(string memory s) public pure returns (bytes memory){
        bytes memory message = abi.encodePacked(
            uint8(bytes(s).length),
            bytes(s)
        );
        return message;
    }
}
