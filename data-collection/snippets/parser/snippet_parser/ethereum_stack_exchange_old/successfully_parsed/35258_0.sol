
    function split2(bytes32 source) constant returns (bytes16, bytes16){
        bytes16[2] memory y = [bytes16(0), 0];
        assembly {
            mstore(y, source)
            mstore(add(y, 16), source)
        }
        return (y[0], y[1]);
    }


    function split3(bytes9 source) constant returns (bytes3, bytes3, bytes3){
        bytes3[3] memory y = [bytes3(0), 0, 0];
        assembly {
            mstore(y, source)
            mstore(add(y, 3), source)
            mstore(add(y, 6), source)
        }
        return (y[0], y[1], y[2]);
    }
