function get(address _addr, string _func) public view returns (bytes data) {
    uint len = 32;
    uint ptr;

    bytes4 sig = bytes4(keccak256(_func));
    assembly {
        ptr := mload(0x40)       
        mstore(ptr, sig)

        let result := call(5000, _addr, 0, ptr, 0x4, ptr, add(len, 0x40))

        if eq(result, 0) {
            revert(0, 0)
        }

        ptr := add(ptr, 0x40)
        mstore(0x40, add(ptr, add(len, 0x40)))
    }

    data = toBytes(ptr, len); 
}

function toBytes(uint _addr, uint _len) internal pure returns (bytes memory bts) {
    bts = new bytes(_len);
    uint btsptr;
    assembly {
        btsptr := add(bts, 0x20)
    }
    copy(_addr, btsptr, _len);
}
