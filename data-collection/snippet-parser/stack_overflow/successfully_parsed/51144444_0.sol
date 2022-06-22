function bytes32ToBytes(uint _offst, bytes32 _input, bytes memory _output) internal pure {
    assembly {
        mstore(add(_output, _offst), _input)
        mstore(add(add(_output, _offst),32), add(_input,32))
    }
}
