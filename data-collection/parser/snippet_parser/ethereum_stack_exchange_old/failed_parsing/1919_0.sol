contract OddsAndEvens2 {

    struct Choice
    {
        bytes32 blindedChoice;
        uint deposit;
    }

    uint public auctionStart;
    uint public biddingEnd;
    uint public revealEnd;
    bool public ended;

    
    uint public OddsOrEvens;

    
    address public playerOneAddress;
    address public playerTwoAddress;
    address public gameWinner;

    
    uint public choiceCount;

    
    uint public revealCount;

    
    uint public playerOneChoice;
    uint public playerTwoChoice;
    uint public sumChoices;

    mapping(address => Choice[]) public choices;

    event AuctionEnded(address winner, uint OddsOrEvens);

    
    
    
    
    modifier onlyBefore(uint _time) { if (now >= _time) throw; _ }
    modifier onlyAfter(uint _time) { if (now <= _time) throw; _ }

    function OddsAndEvens(uint _biddingTime,
                        uint _revealTime)
    {
        auctionStart = now;
        biddingEnd = now + _biddingTime;
        revealEnd = biddingEnd + _revealTime;
    }
    
    
    
    
    
    
    
    
    
    
    function choice(bytes32 _blindedChoice)
        onlyBefore(biddingEnd)
    {
        
        if (choiceCount == 2)
            throw;

        choices[msg.sender].push(Choice({
            blindedChoice: _blindedChoice,
            deposit: msg.value
        }));
        
        choiceCount += 1;
    }

    
    
    
    
    
    
    function reveal(uint _values, uint _secret)
        onlyAfter(biddingEnd)
        onlyBefore(revealEnd)
    {
        if (revealCount == 2)
            throw;
        
        
        var bid = choices[msg.sender][0];  

        if (revealCount == 0)    
            bid = choices[msg.sender][0];
            playerOneChoice = _values;
            revealCount = 1;
            playerOneAddress = msg.sender;
            return;

        if (revealCount == 1)   
            bid = choices[msg.sender][0];
            playerTwoChoice = _values;
            revealCount = 2;
            playerTwoAddress = msg.sender;
            return;   
     }        

    function auctionEnd()
        onlyAfter(revealEnd)
    {
        if (ended) throw;
        
        
        sumChoices = playerOneChoice + playerTwoChoice;
        
        if (sumChoices == 2)
            gameWinner = playerOneAddress;
            OddsOrEvens = 2;
        
        if (sumChoices == 3)
            gameWinner = playerTwoAddress;
            OddsOrEvens = 1;

        AuctionEnded(gameWinner, OddsOrEvens);
        
        

        
        
        gameWinner.send(this.balance);
        ended = true;
    }

    function () { throw; }
}
