
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract PredictionMarket {
    using SafeMath for uint;

    
    address public owner;

    
    mapping(string => Event) public events;

    
    struct Event {
        address eventCreator;
        string name;
        uint eventId;
        uint totalShares;
        uint sharePriceYes;
        uint sharePriceNo;
        uint sharesYes;
        uint sharesNo;
        address[] shareholdersYes;
        address[] shareholdersNo;
    }

    uint public eventId = 0;

    
    uint public balance;

    
    event Purchase(address buyer, string eventName, uint shares, uint totalCost);
    event Refund(address buyer, string eventName, uint shares, uint refundAmount);
    event NewEvent(address eventCreator, string eventName, uint totalShares, uint sharePriceYes, uint sharePriceNo);

    
    constructor() {
        owner = msg.sender;
    }

    
    function createEvent(string memory _eventName, uint _totalShares, uint _sharePriceYes, uint _sharePriceNo) public {
        require(_sharePriceYes > 0, "Share price must be greater than zero");
        require(_sharePriceNo > 0, "Share price must be greater than zero");
        eventId++; 
        events[_eventName] = Event(msg.sender, _eventName, eventId, _totalShares, 0, 0, _sharePriceYes, _sharePriceNo, new address[](0), new address[](0));
        emit NewEvent(msg.sender, _eventName, _totalShares, _sharePriceYes, _sharePriceNo);
    }

    
    function buySharesYes(string memory _eventName, uint _payment) payable public {
        Event storage currentEvent = events[_eventName];
        require(_payment >= currentEvent.sharePriceYes, "Insufficient payment");
        uint shares = _payment / currentEvent.sharePriceYes;
        require(shares <= currentEvent.totalShares - currentEvent.sharesYes, "No more shares available");
        currentEvent.sharesYes += shares;
        balance += _payment;
        currentEvent.shareholdersYes.push(msg.sender);
        events[_eventName] = currentEvent;
        emit Purchase(msg.sender, _eventName, shares, _payment);
    }


    
    function buySharesNo(string memory _eventName, uint _payment) payable public {
        Event storage currentEvent = events[_eventName];
        require(_payment >= currentEvent.sharePriceNo, "Insufficient payment");
        uint shares = _payment / currentEvent.sharePriceNo;
        require(shares <= currentEvent.totalShares - currentEvent.sharesNo, "No more shares available");
        currentEvent.sharesNo += shares;
        balance += _payment;
        currentEvent.shareholdersNo.push(msg.sender);
        events[_eventName] = currentEvent;
        emit Purchase(msg.sender, _eventName, shares, _payment);
    }


    
    function refund(string memory _eventName, uint shares) payable public {
        Event storage currentEvent = events[_eventName];
        require(shares <= currentEvent.sharesYes, "Insufficient shares owned");
        uint refundAmount = shares * currentEvent.sharePriceYes;
        balance -= refundAmount;
        currentEvent.sharesYes -= shares;
        payable(msg.sender).transfer(refundAmount);
        emit Refund(msg.sender, _eventName, shares, refundAmount);
    }

    
    function closeMarket(string memory _eventName, bool result) payable public {
        Event storage currentEvent = events[_eventName];
        require(currentEvent.eventCreator == msg.sender, "Only the event creator can close this market");
        if (result) {
            
            uint totalSharesYes = currentEvent.sharesYes;
            uint totalPayoutYes = totalSharesYes.mul(currentEvent.sharePriceYes);
            uint profitYes = totalPayoutYes.sub(totalSharesYes.mul(currentEvent.sharePriceYes.div(2)));
            balance -= profitYes;
            
            uint profitPerShareYes = currentEvent.sharePriceYes.div(2);
            for (uint i = 0; i < totalSharesYes; i++) {
                address shareholder = currentEvent.shareholdersYes[i];
                payable(shareholder).transfer(profitPerShareYes);
            }
        } else {
            
            uint totalSharesNo = currentEvent.sharesNo;
            uint totalPayoutNo = totalSharesNo.mul(currentEvent.sharePriceNo);
            uint profitNo = totalPayoutNo.sub(totalSharesNo.mul(currentEvent.sharePriceNo.div(2)));
            balance -= profitNo;
            
            uint profitPerShareNo = currentEvent.sharePriceNo.div(2);
            for (uint i = 0; i < totalSharesNo; i++) {
                address shareholder = currentEvent.shareholdersNo[i];
                payable(shareholder).transfer(profitPerShareNo);
            }
        }
    }
}


