    function say() public  constant  returns (string memory output) {
        bytes32 out;
        assembly {
            let memPtr := mload(0x20)
            mstore(memPtr, 0x20)
            let success := call(gas, 10, 0x0, memPtr, 0x20, memPtr, 0x20)
            switch success
            case 0 {
                revert(0,0)
            } default {
                out := mload(memPtr)
            }
        }
        output = bytes32ToStr(out);
    }
