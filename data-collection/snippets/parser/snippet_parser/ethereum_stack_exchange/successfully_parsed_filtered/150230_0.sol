function deploy(address admin, uint256 _salt, Type _type) public {
    bytes32 salt = keccak256(abi.encodePacked(bytes32(_salt), admin));
    address myContract;
    if (_type == Type.A) {
        myContract = address(new A{salt: salt}());
    } else if (_type == Type.B) {
        myContract = address(new B{salt: salt}());
    }
}
