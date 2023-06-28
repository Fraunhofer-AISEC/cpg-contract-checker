function startMint( uint256 quantity, uint256 userProvidedSeed )
    public
    payable
    whenNotPaused
    returns (bytes32)
    {
        
        

        bytes32 requestId = requestRandomness( keyHash, fee, userProvidedSeed );
        requestToQuantity[requestId] = quantity;
        requestToSender[requestId] = msg.sender;

        return requestId;
    }
