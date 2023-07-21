struct Offer {
    address denomination;
    uint principal;
    uint repaymentWithFee;
    address collection;
    uint nft_id;
    address referrer;
    uint32 duration;
    uint16 adminFee_bps;
}

contract DecodePacked {
    function testDecodePacked() external pure returns(Offer memory) {
        bytes memory data = packExample();

        address denomination;
        uint principal;
        uint repaymentWithFee;
        address collection;
        uint nft_id;
        address referrer;
        uint32 duration;
        uint16 adminFee_bps;

        assembly { 
            denomination := mload(add(data,20))
            principal := mload(add(data,52))
            repaymentWithFee := mload(add(data,84))
            collection := mload(add(data,104))
            nft_id := mload(add(data,136))
            referrer := mload(add(data,156))
            duration := mload(add(data,160))
            adminFee_bps := mload(add(data,162))
        }

        return Offer(
            denomination, principal, repaymentWithFee, collection, nft_id, referrer, duration, adminFee_bps
        );
    }

    
    function packExample() public pure returns(bytes memory) {
        return abi.encodePacked(
            abi.encodePacked(
                address(0x01),
                uint256(0x02),
                uint256(0x03),
                address(0x04),
                uint256(0x05),
                address(0x06),
                uint32(0x07),
                uint16(0x08)
            ),
            abi.encodePacked(
                address(0x09),
                uint256(0x10),
                uint256(0x11)
            ),
            address(0x12),
            uint256(0x13)
        );
    }
}
