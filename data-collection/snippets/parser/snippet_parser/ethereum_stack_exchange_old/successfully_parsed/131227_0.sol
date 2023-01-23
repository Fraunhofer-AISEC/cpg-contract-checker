 function generateBlindedBidBytes32(uint value, bool fake) public view returns (bytes32) {
        return keccak256(abi.encodePacket(value, fake));
    }
