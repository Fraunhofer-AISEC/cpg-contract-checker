    # Event to keep track of owner and caller
    event FunctionCall(
        address caller,
        address owner
    );

    
    function listNft( uint256 _tokenId, uint256 _price) public payable nonReentrant {

        # Emit event to inspect caller and owner
        emit FunctionCall(msg.sender ,owner());

        require(_price > 100, "Price must be at least 100 wei");

        # This line doesn't let me through and evaluates to false
        # require(msg.sender == owner(), "Must be owner");

      ...more code
    }

