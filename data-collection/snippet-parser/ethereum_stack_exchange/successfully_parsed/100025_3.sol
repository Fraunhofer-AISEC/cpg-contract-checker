    function predictCloneAddress(address forwarderAddress_, uint256 salt_)
        public
        view
        returns (address)
    {
        address predictedAddress =
            Clones.predictDeterministicAddress(
                forwarderAddress_,
                bytes32(salt_)
            );

        return predictedAddress;
    }
