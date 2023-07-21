contract Hasher{
    
    function hash(uint8 _c, uint256 _salt) constant returns(bytes32) {
        return keccak256(_c,_salt);
    }
}
