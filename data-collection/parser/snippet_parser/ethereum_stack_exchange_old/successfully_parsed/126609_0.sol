function _getCurrentRate() public view returns (uint256 multiplier) {
        assembly {
            let pe := sload(periodEnd.slot)
            let ps := sload(periodStart.slot)
            let rate := sload(compoundRate.slot)

            if lt(timestamp(), pe) {
                multiplier := add(mul(sub(timestamp(), ps), rate), 1000000000000000000)
            } 
            
            if iszero(lt(timestamp(), pe)) {
                multiplier := 2000000000000000000
            }
        }
    }
