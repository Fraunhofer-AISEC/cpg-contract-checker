pragma solidity ^0.4.11;

contract Casino {
    address owner;
    uint public minimumBet = 100 finney; 
    uint public totalBet;
    uint public numberOfBets;
    uint public maxAmountOfBets = 100;
    address[] public players;

    struct Player {
        uint amountBet;
        uint numberSelected;
    }

    
    mapping(address => Player) playerInfo;

    function Casino(uint _minimumBet) public {
        owner = msg.sender;
        if(_minimumBet != 0) minimumBet = _minimumBet;
    }

    
    function() payable public {}

    function kill() public {
        if(msg.sender == owner)
            selfdestruct(owner);
    }

    function checkPlayerExists(address player) constant returns(bool) {
        for(uint i = 0; i < players.length; i++) {
            if(players[i] == player) return true;
        }
        return false;
    }

    
    function bet(uint number) public payable {
        assert(checkPlayerExists(msg.sender) == false);
        assert(number >= 1 && number <= 10);
        assert(msg.value >= minimumBet);

        playerInfo[msg.sender].amountBet = msg.value;
        playerInfo[msg.sender].numberSelected = number;
        numberOfBets += 1;
        players.push(msg.sender);
        totalBet += msg.value;

        if(numberOfBets >= maxAmountOfBets) generateNumberWinner();
    }

    
    function generateNumberWinner() public {
        uint numberGenerated = block.number % 10 + 1; 
        distributePrizes(numberGenerated);
    }

    
    function distributePrizes(uint numberWinner) public {
        address[100] memory winners; 
        uint count = 0; 

        for (uint i = 0; i < players.length; i++) {
            address playerAddress = players[i];
            if(playerInfo[playerAddress].numberSelected == numberWinner) {
                winners[count] = playerAddress;
                count++;
            }
            delete playerInfo[playerAddress]; 
        }

        players.length = 0; 

        uint winnerEtherAmount = totalBet / winners.length; 

        for(uint j = 0; j < count; j++) {
            
            if(winners[j] != address(0)) winners[j].transfer(winnerEtherAmount);
        }
    }
}
