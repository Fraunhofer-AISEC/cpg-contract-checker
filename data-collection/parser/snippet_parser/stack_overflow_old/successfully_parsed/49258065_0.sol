pragma solidity^0.4.17;


contract hashes {
    mapping(uint => string) descriptions;
    mapping(uint => address) senderAddresses;


function uploadHash(uint _hash, string _description) public {
    require(bytes(descriptions[_hash]).length == 0);
    descriptions[_hash] = _description;
    senderAddresses[_hash] = msg.sender;
}

function getHash(uint _hash) public returns (address, string){
    return (senderAddresses[_hash], descriptions[_hash]);
}
}