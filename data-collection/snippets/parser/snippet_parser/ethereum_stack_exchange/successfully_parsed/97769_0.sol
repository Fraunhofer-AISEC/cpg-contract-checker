contract Forecast {
    
    struct Bet {
        address payable owner;
        uint price;
    }   

    
    mapping(uint => Bet) bets;
    
    
    uint public betCount;

    
    uint public betValue; 

    
    uint public accPot;

    
    error NotEnoughFunds();

    constructor (uint _betValue) {
        betValue = _betValue;
    }

    function bet(uint price) public payable {
            
        if (betValue > msg.value)
            revert NotEnoughFunds();
        
        bets[betCount++] = Bet(payable(msg.sender), price);
        accPot += msg.value;
    } 
}
