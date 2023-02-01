pragma solidity ^0.4.0;

library Arithmetic {
    struct Data {
        bytes1[10] mData;
    }

    function doSomeMath(Data s, bytes1 _input, uint8 _idx) internal pure returns (bytes1) {
        s.mData[_idx] = _input;
        return _input;
    }
}
