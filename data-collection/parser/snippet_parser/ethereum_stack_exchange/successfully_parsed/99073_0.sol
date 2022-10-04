pragma solidity ^0.5.0;

contract roulette {
    
    
    enum BetType { Color, Number }
    
    struct Bet {
        address user;
        uint amount;
        uint block;
        int choice;
        BetType betType;
    }
    
    uint public counter = 0;
    int public result;
    
    mapping(uint => Bet) public bets;
    mapping(int => int) public colors;
    
    uint public constant NUM_POCKETS = 38;
    
    uint8[18] public RED_NUMBERS = [
        1, 3, 5, 7, 9, 12,
        14, 16, 18, 19, 21, 23,
        25, 27, 30, 32, 34, 36
        ];
        
    uint8[18] public BLACK_NUMBERS = [
        2, 4, 6, 8, 10, 11,
        13, 15, 17, 20, 22, 24,
        26, 28, 29, 31, 33, 35
        ];
        
    function Start() public {
        for(uint i = 0; i < 18; i++) {
            colors[RED_NUMBERS[i]] = 1;
        }

    }
        
    function makeBet(BetType _betType, int _choice) payable public {
        if(_betType == BetType.Color)
            require(_choice == 0 || _choice == 1);
        else require(_choice >= -1 && _choice <=36);
        counter++;
        bets[counter] = Bet(msg.sender, msg.value, block.number, _choice, _betType);
    }
    
    function spinAll() public {
        bytes32 random = keccak256(abi.encodePacked(now, msg.sender));
        result = int(uint(random) % NUM_POCKETS) - 1;
        for(uint i = 0; i < counter; i++) {
            resolveBets(i);
        }
        counter = 0;
    }
    
    function resolveBets(uint id) payable public {
        Bet storage bet = bets[id];
        require(msg.sender == bet.user);
        if(bet.betType == BetType.Color) {
            if(bet.choice == colors[result] && result > 0)
                msg.sender.transfer(bet.amount * 2);       
                
        }
        else if(bet.betType == BetType.Number)
        {
            if(result == bet.choice)
                msg.sender.transfer(bet.amount * 35);
        }
        
        delete bets[id];
    }
}
