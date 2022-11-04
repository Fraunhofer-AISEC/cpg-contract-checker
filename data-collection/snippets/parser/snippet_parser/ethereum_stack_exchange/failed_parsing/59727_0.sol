function record(bytes script, address contract) public {

    bytes4 sig = bytes4(0x912610ab);
    uint256 flag = uint256At(script, 0);
    uint256 location = 0x20;

    while (location < script.length) {
        uint256 id = uint256At(script, location);
        assembly {
            let x := mload(0x40)
            mstore(x,sig)          
            mstore(add(x,0x04),id) 
            switch call(sub(gas, 5000), contract, 0, x, 0x24, 0, 0)
            case 0 {
                revert(0, 0)
            }
        }
        location += 0x20;
    }

    handle(flag);
}

function uint256At(bytes data, uint256 location) pure internal returns (uint256 result) {
    assembly {
        result := mload(add(data, add(0x20, location)))
    }
}
