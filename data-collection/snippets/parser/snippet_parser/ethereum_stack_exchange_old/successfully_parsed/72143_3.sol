pragma solidity ^0.4.25;

contract NotMyContract1 {
    uint256 a = 721;
    function func() external view returns (uint256) {
        return a;
    }
}

contract NotMyContract2 {
    uint256 a = 9;
    uint256 b = 8;
    function func() external view returns (uint256, uint256) {
        return (a, b);
    }
}

contract MyContract {

    constructor() public {}

    function getValue(address _address) public view returns (uint, uint) {
        bytes4 sig = bytes4(keccak256("func()"));
        assembly {
            let ptr := mload(0x40)
            mstore(ptr,sig)

            let result := staticcall(not(0), _address, ptr, 0x04, ptr, 0x20)

            let size := returndatasize
            returndatacopy(ptr, 0, size)

            switch result case 0 { revert(0, 0) }
            default {
                if lt(size,64) { return (ptr, 0x40) }
                if gt(size,32) { return (ptr,size) }
            }
        }
    }
}
