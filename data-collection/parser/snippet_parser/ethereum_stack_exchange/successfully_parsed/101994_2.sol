
pragma solidity ^0.8.5;

contract KeyTest {
    function test() public returns (address) {    
        string memory key = "3b88b538dff7db813b6c8be6bfce81f6dd9d820213fe9211e9f5a631c360c7ddbb26690ae40eac62e0b5aaf2d8a5c4287e3c383fc1c00916ce12e354e1eb12eb";
        string memory addrOriginal = "0x622cf04ee8659bc45d76def393077ddcc5396761";
        
        
        bytes memory bytesKey = abi.encodePacked(key);
        
        
        
        bytes32 keyHash = keccak256(bytesKey);
        
        
        address addr;
        
        address addr;
        assembly {
            mstore(0, keyHash)
            addr := mload(0)
        }
        
        
        return addr;
    }
}
