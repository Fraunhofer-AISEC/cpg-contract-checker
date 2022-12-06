pragma solidity ^0.8.0;

contract SecretMessage {
    bytes32 public hashedKey;
    bytes public encryptedMessage;
    address solver;

    constructor (bytes32 _hashedKey, bytes memory _encryptedMessage) {
        hashedKey = _hashedKey;
        encryptedMessage = _encryptedMessage;
    }

    function revealMessage(string memory key) public returns (bytes memory) {
        bytes32 hashed = keccak256(abi.encode(key));
        require(hashed == hashedKey, "Incorrect key!");
        require(solver == address(0), "Already solved!");
        solver = msg.sender;
        return encryptDecrypt(encryptedMessage, abi.encode(key));
    }

    
    function encryptDecrypt(bytes memory data, bytes memory key)
        public
        pure
        returns (bytes memory result)
    {
        
        uint256 length = data.length;

        assembly {
            
            result := mload(0x40)
            
            mstore(0x40, add(add(result, length), 32))
            
            mstore(result, length)
        }

        
        for (uint256 i = 0; i < length; i += 32) {
            
            bytes32 hash = keccak256(abi.encodePacked(key, i));

            bytes32 chunk;
            assembly {
                
                chunk := mload(add(data, add(i, 32)))
            }
            
            chunk ^= hash;
            assembly {
                
                mstore(add(result, add(i, 32)), chunk)
            }
        }
    }
}

