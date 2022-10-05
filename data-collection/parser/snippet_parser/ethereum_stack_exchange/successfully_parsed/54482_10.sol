function returnMsg(uint256 amount) public

    returns (bytes32)

    {
        bytes32 message = prefixed(keccak256(abi.encodePacked(this, amount)));
        return message;
    }
