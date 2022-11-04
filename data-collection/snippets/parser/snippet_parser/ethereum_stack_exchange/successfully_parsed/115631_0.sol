pragma solidity ^ 0.8.10;

contract RPS {

    
    string playerChoice;
    string computerChoice;

    string[] playerChoices = ["rock", "paper", "scissors"];
    string[] computerChoices = ["rock", "paper", "scissors"];
    



    function getPlayerChoice() public view returns (string memory) {
        return playerChoice;
    }
    
    function chooseRock() public {
        playerChoice = playerChoices[0];
    }

    function choosePaper() public {
        playerChoice = playerChoices[1];
    }

    function chooseScissors() public {
        playerChoice = playerChoices[2];
    }
    
    function random() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp)));
    }    

    function computerPicks() private returns (string memory) {
        computerChoice = computerChoices[random() % computerChoices.length];
        return computerChoice;
    }
    
    function playerWins() internal view returns (string memory) {
        string memory winningPhrase = "Congrats, you won!";
        return winningPhrase;
    }

    function computerWins() internal view returns (string memory) {
        string memory losingPhrase = "Sorry, you lose.";
        return losingPhrase;
    }

    function tie() internal view returns (string memory) {
        string memory tiePhrase = "It's a tie!";
        return tiePhrase;
    }
    
    function rockPaperScissors() public {
        computerPicks();
        if (keccak256(abi.encodePacked(playerChoice)) == keccak256(abi.encodePacked((computerChoice)))) {
           tie();
        } else if (playerChoice == "rock" && computerChoice == "paper") {
            
        } else if (playerChoice == "rock" && computerChoice == "scissors") {
           
        } else if (playerChoice == "paper" && computerChoice == "rock") {
           
        } else if (playerChoice == "paper" && computerChoice == "scissors") {
            
        } else if (playerChoice == "scissors" && computerChoice == "rock") {
             
        } else if (playerChoice == "scissors" && computerChoice == "paper") {
            
        }
    } 
}
            
    
