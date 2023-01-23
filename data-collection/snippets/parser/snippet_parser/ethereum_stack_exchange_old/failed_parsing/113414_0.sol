) public ERC1155(“https:
    x_lastTimeStamp = block.timestamp;
    x_keyHash = _keyHash;
    x_chainlinkFee = _chainlinkFee;
    x_ticketFee = _ticketFee;
    x_interval = _interval;
    x_theWinner = 0x0000000000000000000000000000000000000000;
    x_lotteryState = lotteryState.OPEN;
    }
    
    function mintImage(string memory tokenURI)
    public
    payable
    returns (uint256)
    {
    
    x_tokenIds.increment();
    uint256 newItemId = x_tokenIds.current();
    _mint(msg.sender, newItemId, 1, “”);
    _setURI(tokenURI);
    x_userMintCount[msg.sender] = x_userMintCount[msg.sender] + 1;
    if(x_userMintCount[msg.sender] % 3 == 0){
    x_usersEntered.push(payable(msg.sender));
    emit enteredDraw(msg.sender);
    }
    return newItemId;
    }
