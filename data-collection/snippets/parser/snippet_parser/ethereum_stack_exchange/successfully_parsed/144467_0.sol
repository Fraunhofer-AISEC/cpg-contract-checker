function readBySlot(uint256 slot) external view override returns(bytes32 value) {
        assembly {
            value := sload(slot)
        }
    }
