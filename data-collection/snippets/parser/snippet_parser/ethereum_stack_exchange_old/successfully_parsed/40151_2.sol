pragma solidity ^0.4.0;

contract TwoupFactory {
    address[] public deployedTwoUpGames;

    function createTwoUpGame(uint minimum) payable public {
        Twoup  newTwoup = new Twoup(minimum, msg.sender);
        deployedTwoUpGames.push(newTwoup);
    }

    function getDeployedCampaigns() public view returns (address[]) {
        return deployedTwoUpGames;
    }
}

contract Twoup {
    struct Player {
        uint BetAmount;
        address Address;
        bool PickedHeads;
    }

    struct TossResult {
        bool HeadsCoinOne;
        bool HeadsCoinTwo;
    }

    TossResult[] public tosses; 
    Player[] public players;
    address public spinner;    
    uint public kitty; 
    uint public totalBet;
    bool isGameCompleted;

    function Twoup(uint housekitty, address newSpinner) public payable
    {
        require(msg.value > 10 ether);
        spinner = newSpinner;
        kitty = housekitty;
        isGameCompleted = false; 
        totalBet = 0;
    }    

    function tossCoin() private view returns (bool) {
        return ((uint(keccak256(block.difficulty, now, getStructHash())) % 2) == 0);
    }

    function getStructHash() public view returns(bytes32){
        bytes32 hash;
        for(uint index=0;index<players.length;index++){
            hash = keccak256(players[index].BetAmount, players[index].Address, players[index].PickedHeads, hash);
        }
        return hash;
    }

    function pickWinner() public 
    {
        require(msg.sender == spinner);
        require(isGameCompleted == false);
        TossResult memory result= TossResult({ HeadsCoinOne: tossCoin(), HeadsCoinTwo: tossCoin() });
        tosses.push(result);
    }   
}
