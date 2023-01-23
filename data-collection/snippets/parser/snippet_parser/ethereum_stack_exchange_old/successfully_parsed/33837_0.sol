pragma solidity ^0.4.11;

contract Casino {


    uint minimumBet;
    uint totalBet;
    uint numberOfBets;
    uint maximumAmountsOfBets = 100;
    address[] players;

    struct Player {

        uint amountBet;
        uint numberSelected;
    }


    mapping(address => Player) playerInfo;


    address owner; 


    function Casino(uint _minimumBet) public{  
        

        owner = msg.sender;
        if(_minimumBet !=0) minimumBet = _minimumBet;

        }

        


    function bet(uint number) payable public {

        require(checkPlayerExists(msg.sender) );
        require(number >= 1 && number <= 10);
        require(msg.value >= minimumBet);


        playerInfo[msg.sender].amountBet = msg.value;
        playerInfo[msg.sender].numberSelected = number;
        numberOfBets += 1;
        players.push(msg.sender);
        totalBet += msg.value;

        if(numberOfBets >= maximumAmountsOfBets) generateNumberWinner();


        }



    function checkPlayerExists(address player) public view returns(bool) {

        for( uint i = 0 ; i < players.length; i++){
            if(players[i] == player) return true;
        }
        return false;
    }


    

    function generateNumberWinner() public{

        uint numberGenerated = block.number % 10 + 1; 

        distributePrizes(numberGenerated);
    }


    

    function distributePrizes(uint numberWinner) public {

        address[100] memory winners ; 

        uint count = 0; 

        for(uint i = 0; i < players.length ; i++) {
            address playerAddress = players[i];
            if(playerInfo[playerAddress].numberSelected == numberWinner){
                winners[count] = playerAddress;
                count ++;
            }
            delete playerInfo[playerAddress]; 


        }

        players.length = 0; 

        uint winnerEtherAmount = totalBet / winners.length; 

        for(uint j = 0; j < count; j++) {

            if(winners[j] !=address(0)) 
            winners[j].transfer(winnerEtherAmount);
        }


    }

    
    function() payable private{}



    function kill() private{ 

        if(msg.sender == owner)
            selfdestruct(owner);
    }
}
