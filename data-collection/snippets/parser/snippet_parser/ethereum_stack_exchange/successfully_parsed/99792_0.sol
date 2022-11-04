pragma solidity ^0.8.4;

import "https://github.com/smartcontractkit/chainlink/blob/master/evm-contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract Bet {

    
    uint constant STATUS_WIN = 1;
    uint constant STATUS_LOSE = 2;
    uint constant STATUS_TIE = 3;
    uint constant STATUS_PENDING = 4;

    
    uint constant STATUS_NOT_STARTED = 1;
    uint constant STATUS_STARTED = 2;
    uint constant STATUS_COMPLETE = 3;

    
    uint constant STATUS_ERROR = 4;

    
    struct DoubleBet {
        uint guess;
        address addr;
        uint status;
    }

    
    struct Game {
        uint256 betAmount;
        uint outcome;
        uint status;
        DoubleBet creator;
        DoubleBet taker;
    }
    
    Game game;
    
    receive() external payable {
    }
    
    address payable owner;
    
        AggregatorV3Interface internal priceFeed;

    
    constructor() public {
        priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);
    }
    
    function createBet(uint _guess) public payable {
      game = Game(msg.value, 0, STATUS_STARTED, DoubleBet(_guess, msg.sender, STATUS_PENDING), DoubleBet(0, msg.sender, STATUS_NOT_STARTED));
      game.creator = DoubleBet(_guess, msg.sender, STATUS_PENDING);
    }

    function takeBet(uint _guess) public payable { 
      
      require(msg.value == game.betAmount);
      game.taker = DoubleBet(_guess, msg.sender, STATUS_PENDING);
      generateBetOutcome();
    }
    
    function generateBetOutcome() private {
        game.outcome = uint(getThePrice());
        game.status = STATUS_COMPLETE;
        
        if (game.creator.guess == game.taker.guess) {
          game.creator.status = STATUS_TIE;
          game.taker.status = STATUS_TIE;
        } else if (game.creator.guess > game.outcome && game.taker.guess > game.outcome) {
          game.creator.status = STATUS_TIE;
          game.taker.status = STATUS_TIE;
        } else {
           if ((game.outcome - game.creator.guess) < (game.outcome - game.taker.guess)) {
             game.creator.status = STATUS_WIN;
             game.taker.status = STATUS_LOSE;
           } else if ((game.outcome - game.taker.guess) < (game.outcome - game.creator.guess)) {
             game.creator.status = STATUS_LOSE;
             game.taker.status = STATUS_WIN;
           } else {
             game.creator.status = STATUS_ERROR;
             game.taker.status = STATUS_ERROR;
             game.status = STATUS_ERROR;
           }
        }
    }

     function getBetOutcome() public view returns
     (string memory description, string memory originatorKey, uint originatorStatus, string memory takerKey, uint takerStatus) 
     {
        if (game.creator.status == STATUS_TIE || game.taker.status == STATUS_TIE) {
          description = "Both bets were the same or were over the number, the pot will be split";
        } else {
            if (game.creator.status == STATUS_WIN) {
             description = "Bet originator guess was closer to the number and will receive the pot";
           } else if (game.taker.status == STATUS_WIN) {
             description = "Bet taker guess was closer to the number and will receive the pot";
           } else {
             description = "Unknown Bet Outcome";
           }
        }
        originatorKey = "creator";
        originatorStatus = game.creator.status;
        takerKey = "taker";
        takerStatus = game.taker.status;
     }

    
    function getThePrice() public view returns (int) {
        (
            uint80 roundID, 
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        return price;
    }
    
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    
    
    function getBalance() public view returns (uint balance) {
        return address(this).balance;
    }
    
    
}


