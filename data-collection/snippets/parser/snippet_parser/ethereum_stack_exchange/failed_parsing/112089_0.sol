function addPlayer(Choice _choice, uint256 passcode) public payable {           
Players[playerNum] = Player(msg.sender,keccak256(abi.encode(passcode,_choice,msg.sender)),Choice.Nothing);
