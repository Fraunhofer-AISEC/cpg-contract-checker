function getEndpointBroker(address oracleAddress, bytes32 endpoint) public view returns (address) {
        return address(uint160(bytes20(keccak256(abi.encodePacked('oracles', oracleAddress, endpoint, 'broker')))));
    }
