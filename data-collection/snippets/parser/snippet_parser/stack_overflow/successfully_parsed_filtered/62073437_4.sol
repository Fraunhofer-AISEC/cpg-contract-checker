pragma solidity ^0.4.24;
contract LeagueWinners{
    address public manager;
    
    uint256 MINIMUM = 1000000000000000;
    constructor() public{
        manager = msg.sender;
    }

    struct Player {
        address playerAddress;
        uint score;
    }

    Player[] public players;


    
    function enter(uint value) public payable{
        assert(msg.value > MINIMUM);
        players.push(Player(msg.sender, value));
    }

    
    function winningPlayer() public view
            returns (address winner)
    {
        uint winningScore = 0;
        for (uint p = 0; p < players.length; p++) {
            if (players[p].score > winningScore) {
                winningScore = players[p].score;
                winner = players[p].playerAddress;
            }
        }
    }

    
    function getWinner() public{
        require(msg.sender == manager, "Only a manager is allowed to perform this operation");
        

        address winner = winningPlayer();
        
        
        winner.transfer(address(this).balance);
        
        
        delete players;
        
    }
}
