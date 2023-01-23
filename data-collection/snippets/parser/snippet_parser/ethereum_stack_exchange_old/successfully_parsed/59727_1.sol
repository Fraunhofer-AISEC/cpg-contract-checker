function callByBytes(bytes4 _func, bytes _param) public {
    address _tmpAddr = addr;
    uint paramLen = _param.length;
    uint allLen = 4 + paramLen;
    assembly {
        let p := mload(0x40)
        mstore(p, _func)
        for { let i := 0 } lt(i, paramLen) { i := add(i, 32) } {
            mstore(add(p, add(4,i)), mload(add(add(_param, 0x20), i)))
        }

        let success := call(not(0), _tmpAddr, 0, p, allLen, 0, 0)

        let size := returndatasize
        returndatacopy(p, 0, size)

        switch success
        case 0 {
            revert(p, size)
        }
        default {
            return(p, size)
        }
    }
}
