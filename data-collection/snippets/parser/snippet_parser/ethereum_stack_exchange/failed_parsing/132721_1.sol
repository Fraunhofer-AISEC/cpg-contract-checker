contract Factory {
    ...

    function createChild(uint256 id) public returns(address child) {
        child = getAddress(id);
        if (child.code.length != 0) return child; 

        bytes32 salt = keccak256(abi.encodePacked(id));
        new Child{salt: salt}(id);

        children[id] = child;
    }
  
    function getAddress(uint256 id) public view returns(address) {
        bytes32 salt = keccak256(abi.encodePacked(id));
        bytes32 bytecodeHash = keccak256(abi.encodePacked(type(Child).creationCode, id));

        bytes32 _data = keccak256(abi.encodePacked(bytes1(0xff), address(this), salt, bytecodeHash));
        return address(uint160(uint256(_data)));
    }
}

contract Child {
    ...

    constructor(uint256 _id) {
        id = _id;
    }
}
