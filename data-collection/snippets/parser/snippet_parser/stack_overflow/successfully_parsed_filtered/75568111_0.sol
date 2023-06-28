    function convertAddressAndIpfsAndUniqueVector(address _addr, string memory _ipfsHash, uint32 _random) public view returns (uint256) {
        bytes memory ipfsBytes = hexStringToBytes(_ipfsHash);
        bytes memory addrBytes = abi.encodePacked(_addr);
        bytes memory combinedBytes = new bytes(ipfsBytes.length + addrBytes.length + 4);
        uint i;
        for (i = 0; i < ipfsBytes.length; i++) {
            combinedBytes[i] = ipfsBytes[i];
        }
        for (i = 0; i < addrBytes.length; i++) {
            combinedBytes[ipfsBytes.length + i] = addrBytes[i];
        }
        for (i = 0; i < 4; i++) {
            combinedBytes[ipfsBytes.length + addrBytes.length + i] = bytes1(uint8(_random / (2**(8*(3-i)))));
        }
        return uint256(keccak256(combinedBytes));
    }

    function convertUint256ToAddressIpfsAndUniqueVector(uint256 _combined) public view returns (address, string memory, uint32) {
        bytes32 combinedBytes32 = bytes32(_combined);
        uint32 random = uint32(uint8(combinedBytes32[31])) * (2**24) + uint32(uint8(combinedBytes32[30])) * (2**16) + uint32(uint8(combinedBytes32[29])) * (2**8) + uint32(uint8(combinedBytes32[28]));
        bytes memory combinedBytes = new bytes(28);
        for (uint i = 0; i < 28; i++) {
            combinedBytes[i] = combinedBytes32[i];
        }
        string memory ipfsHash = bytesToHexString(combinedBytes);
        address addr;
        assembly {
            addr := mload(add(combinedBytes, 0x20))
        }
        return (addr, ipfsHash, random);
    }
