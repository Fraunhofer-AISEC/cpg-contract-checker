function enter() public payable {
        require(msg.value > .01 ether);
        players.push(msg.sender);
    }
