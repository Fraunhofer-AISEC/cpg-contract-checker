    constructor() public payable {
        require(msg.value > 0, "Player 1 must bet a positive amount");
        assert(address(this).balance == msg.value); 
    }
    
    function matchBet() external payable {
        require(msg.sender != players[0].addr, "Player 1 can't match his own bet.");
        
        address(this).transfer(address(this).balance);
    }
