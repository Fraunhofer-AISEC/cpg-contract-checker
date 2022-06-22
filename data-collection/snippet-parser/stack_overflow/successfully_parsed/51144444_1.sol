function test() public pure returns (bytes) {
    bytes32 i = "some message";
    bytes memory o = new bytes(32); 
    bytes32ToBytes(0, i, o);
    
    return o;
}

function bytes32ToBytes(uint _offst, bytes32 _input, bytes memory _output) internal pure {
    assembly {
        mstore(add(add(_output, _offst),32), add(_input,32))
    }
}
