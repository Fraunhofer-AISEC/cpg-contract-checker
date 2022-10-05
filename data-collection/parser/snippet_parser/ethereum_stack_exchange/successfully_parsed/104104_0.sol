    function sliceUint(bytes bs, uint start)
        internal pure
        returns (uint)
    {
        require(bs.length >= start + 32, "slicing out of range");
        uint x;
        assembly {
            x := mload(add(bs, add(0x20, start)))
        }
        return x;
    }
