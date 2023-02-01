function do_sth() public view returns (address[] memory, uint256) {
        address[] memory ads;
        uint256 input;

        assembly {
            let tmp := 0

            
            let offset := 0x4

            
            
            
            let adsCount := div(sub(sub(calldatasize(), 0x04), 0x20), 0x14)

            
            ads := mload(0x40)
            mstore(0x40, add(ads, add(0x20, mul(adsCount, 0x20))))

            
            mstore(ads, adsCount)

            
            
            
            
            
            for {let i := 0} lt(i, adsCount) {i := add(i, 1)} {
                tmp := calldataload(offset)
                tmp := shr(96, tmp)
                mstore(add(add(ads, 0x20), mul(i, 0x20)), tmp)
                offset := add(offset, 0x14)
            }

            
            input := calldataload(offset)
        }

        return (ads, input);
    }
