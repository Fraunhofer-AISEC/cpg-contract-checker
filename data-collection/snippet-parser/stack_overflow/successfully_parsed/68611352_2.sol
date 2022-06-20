pragma solidity ^0.8;

contract TestContract {
    
    function getsubstring() external pure returns (bytes7, uint256) {
        bytes32 hmacSha256 = 0xf83bf40815929b2448b230d51fa2eaa5b8ccffd87691db7e62bf817b2cbb56ad;

        bytes7 first7Bytes = bytes7(hmacSha256); 
        bytes7 thirteenHexCharacters = first7Bytes >> 4; 

        bytes32 castBytes = bytes32(thirteenHexCharacters); 
        bytes32 castBytesMoved = castBytes >> 200; 
        uint256 integerValue = uint256(castBytesMoved); 

        return (thirteenHexCharacters, integerValue);
    }
}
