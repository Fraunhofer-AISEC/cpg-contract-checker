pragma solidity >=0.7.0 <0.9.0;

contract MyTextCounter {
    function count(string memory text) external pure returns (uint256 count) {
        return bytes(text).length;
        
    }
    
    function echo(string calldata text) external pure returns (string calldata textReturn) {
        return string(text);
    }
}
