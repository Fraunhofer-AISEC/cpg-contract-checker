pragma solidity ^0.8.0;

import "@openzeppelin/solidity/math/SafeMath.sol";
import "@openzeppelin/solidity/access/AccessControl.sol";



contract MarketPrediction is Upgradeable, AccessControl {
    using SafeMath for uint256;

    
    mapping(bytes32 => Event) public events;

    
    mapping(address => Balances) public userBalances;

    
    struct Balances {
        uint256 eth;
        uint256 bnb;
        uint256 dai;
        uint256 usdt;
        uint256 usdc;
        uint256 busd;
    }

    
    struct Event {
        bytes32 eventId;
        uint256 startTime;
        uint256 endTime;
        bytes32 result;
        uint256 totalBet;
        uint256 numBets;
        mapping(bytes32 => uint256) bets;
    }   
    
    event BetPlaced(
        bytes32 indexed eventId,
        address indexed user,
        bytes32 indexed prediction,
        uint256 betAmount,
        string currency
    );

    
    event ResultRevealed(
        bytes32 indexed eventId,
        bytes32 indexed result
    );

    
    event Withdrawal(
        address indexed user,
        uint256 amount,
        string currency
    );

    
    constructor() public {
        setOwner(msg.sender);
    }

    
    function createEvent(
        bytes32 eventId,
        uint256 startTime,
        uint256 endTime,
        bytes32 result
    )
        public
        onlyOwner
        returns (bool success)
    {
        require(events[eventId].totalBet == 0, "Event already exists");

        
        events[eventId] = Event({
            eventId: eventId,
            startTime: startTime,
            endTime: endTime,
            result: result,
            totalBet: 0,
            numBets: 0,
            bets: mapping(bytes32 => uint256)new(0)
        });

        return true;
    }

    
    function placeBet(
        bytes32 eventId,
        bytes32 prediction,
        uint256 betAmount,
        string currency
    )
        public
        payable
        returns (bool success)
    {
        
        Event storage event = events[eventId];
        require(event.totalBet > 0, "Event does not exist or has ended");
        require(now >= event.startTime && now <= event.endTime, "Event is not active");

        
        require(userBalances[msg.sender][currency] >= betAmount, "Insufficient balance");

        
        event.totalBet = event.totalBet.add(betAmount);
        event.numBets = event.numBets.add(1);
        event.bets[prediction] = event.bets[prediction].add(betAmount);

        if (currency == "eth") {
            userBalances[msg.sender].eth = userBalances[msg.sender].eth.sub(betAmount);
        } else if (currency == "bnb") {
            userBalances[msg.sender].bnb = userBalances[msg.sender].bnb.sub(betAmount);
        } else if (currency == "dai") {
            userBalances[msg.sender].dai = userBalances[msg.sender].dai.sub(betAmount);
        } else if (currency == "usdt") {
            userBalances[msg.sender].usdt = userBalances[msg.sender].usdt.sub(betAmount);
        } else if (currency == "usdc") {
            userBalances[msg.sender].usdc = userBalances[msg.sender].usdc.sub(betAmount);
        } else if (currency == "busd") {
            userBalances[msg.sender].busd = userBalances[msg.sender].busd.sub(betAmount);
        }

        
        emit BetPlaced(eventId, msg.sender, prediction, betAmount, currency);

        return true;
    }

     
    function revealResult(
        bytes32 eventId,
        bytes32 result
    )
        public
        onlyOwner
        returns (bool success)
    {
        Event storage event = events[eventId];

        
        require(event.totalBet > 0, "Event does not exist or is still active");
        require(now > event.endTime, "Event is still active");

        
        event.result = result;
        emit ResultRevealed(eventId, result);

        return true;
    }

    
    function withdraw(string currency)
        public
        returns (bool success)
    {
        
        require(userBalances[msg.sender][currency] > 0, "Insufficient balance");

        
        uint256 amount = userBalances[msg.sender][currency];
        if (currency == "eth") {
            msg.sender.transfer(amount);
        } else if (currency == "bnb") {
            
        } else if (currency == "dai") {
            
        } else if (currency == "usdt") {
            
        } else if (currency == "usdc") {
            
        } else if (currency == "busd") {
            
        }

        userBalances[msg.sender][currency] = 0;
        emit Withdrawal(msg.sender, amount, currency);

        return true;
    }
}
