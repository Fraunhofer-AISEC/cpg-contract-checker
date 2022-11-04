    contract Lottery {
    
...
    
        address[] public players;
    
...
    
    function random() private view returns (uint256){
            return uint(keccak256(block.difficulty, now, players));
        }
    
    ...
    
     function pickWinner() public restricted {
    ...
    
           uint256 index = random() % players.length;
           players[index].transfer(this.balance);
        
        ...
    }
