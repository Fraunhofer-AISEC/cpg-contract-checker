mapping (bytes32 => uint8[]) hashToCoordinates;

function getCoordinates(bytes32 hash) public view returns(uint8[] memory){
    return hashToCoordinates[hash]
}

function addCoordinates(uint8[] crds) public returns(bytes32){
    bytes32 hash = keccak256(abi.encodePacked(crds));
    hashToCoordinates[hash] = crds;
    return hash
}
