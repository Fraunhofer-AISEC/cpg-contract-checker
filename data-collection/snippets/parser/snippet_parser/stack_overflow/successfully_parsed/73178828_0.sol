
function draw_daily(uint256 _randomness) public payable onlyOwner returns(address){
        require(Daily.time_end < block.timestamp, 'Draw period not over');
        uint256 index = generate_random(_randomness, (Daily.participants.length));
        uint256 prize = Daily.total_amount - ((Daily.total_amount * Daily.owner_share)/100);
        address lucky_winner = Daily.participants[index];
        Daily.total_amount = 0;
        delete Daily.participants;
        return lucky_winner;
    }
    

