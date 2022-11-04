

pragma solidity ^0.8.16;

contract CoinFlip {
  
    uint roundId;
    uint betAmount;
    uint royalty;
    address owner;
    address payable[] players;

    struct round {
       address payable player;
       uint betAmount;
       bool playerChoice; 
       bool draw;
       bool win; 
       uint winAmount;
    }

    round public myRound;
    mapping (uint => round) public flipHistory; 
        
    constructor() {
        owner = msg.sender;
        betAmount = 0;
        roundId = 0;
    }

    function setRoyalty(uint _royalty) public onlyOwner returns (uint) {
        return royalty = _royalty / 100;
    }

    function getRandomNumber(uint _bet, bool _playerChoice) public payable {
        
        require(msg.value > .001 ether);

        
        players.push(payable(msg.sender));

        
        roundId = roundId+1;

        
        myRound.player = payable(msg.sender);

        
        myRound.betAmount = _bet;

        
        myRound.playerChoice = _playerChoice;

        myRound.draw = uint256(keccak256(abi.encodePacked(
              msg.sender,
            )
          )
        )
        % 2 == 1;
        payWinner();

    }

    function payWinner() private {
        if (myRound.draw == myRound.playerChoice) {   
         myRound.win = true;

         
         myRound.winAmount = myRound.betAmount * (2 - royalty);
        
         
         flipHistory[roundId] = myRound;
         
         payable(myRound.player).transfer(myRound.winAmount); 
        } 
        else {
         myRound.win = false;

         
         flipHistory[roundId] = myRound;
        }
    }


    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

}
