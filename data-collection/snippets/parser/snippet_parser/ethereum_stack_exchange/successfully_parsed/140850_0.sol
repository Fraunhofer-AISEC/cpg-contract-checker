pragma solidity ^0.6.0;

import "https://github.com/ethereum/swarm/blob/develop/api/src/api.sol";


contract PrivateDataStorage {
    
    SwarmAPI api;

    
    function storePrivateData(bytes memory data) public {
        
        bytes32 dataHash = keccak256(data);

        
        api.store(data);

        
        return dataHash;
    }

    
    function getPrivateData(bytes32 dataHash) public view returns (bytes memory) {
        
        return api.get(dataHash);
    }
}
