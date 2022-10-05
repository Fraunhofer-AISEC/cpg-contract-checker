        address addr1 = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8;
        bytes memory addr2 = "0x70997970C51812dc3A010C7d01b50e0d17dc79C8";
        require(keccak256(abi.encodePacked(addr1)) == keccak256(addr2), 'not equal');
