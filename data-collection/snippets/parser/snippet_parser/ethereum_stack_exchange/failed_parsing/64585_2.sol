mapping(bytes32 => uint256) private storage;

function encodeFunc(uint256 itemId, address owner) private pure returns(bytes32) {
    return keccak256(abi.encodePacked(itemId, owner));
}

function buy(uint256 itemId, address owner) public returns(uint256) {
    storage[encodeFunc(itemId, owner)]++;
    return itemId;
}
