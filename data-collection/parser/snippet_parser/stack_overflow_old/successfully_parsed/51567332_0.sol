pragma solidity ^0.4.22;
contract UserStore {
    mapping(uint => bytes32) UserHashes; 

    event HashStored (
        uint id,
        bytes32 original, 
        bytes32 hash
    );


    function HashData(bytes32 data) returns (bytes32){
        return sha256(abi.encodePacked(sha256(abi.encodePacked(data))));
    }


    function StoreHash(uint user_id,  bytes32 data) external view returns (bytes32){ 
        UserHashes[user_id] = HashData(data);
        HashStored(user_id, data, UserHashes[user_id]);
        return UserHashes[user_id];
    }

    
    function GetHash(uint u_id) view public returns (bytes32){
        return UserHashes[u_id];
    }
}
