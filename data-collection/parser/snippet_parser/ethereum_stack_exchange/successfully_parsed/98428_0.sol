contract prediction {
    
    enum Side { A, B }
    
    struct Result {
        Side WINNER;
        Side LOSER;
    }
    
    Result public result;
    
    uint public counter;
    
    bool ended;
    
    address private owner;
    
    constructor() {
        ended = false;
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner, "You cannot access this part");
        _;
    }
    
    
    
    
    mapping(Side => uint) public sideCounter;
    
    mapping(Side => uint) public bets;
    
    mapping(address => mapping(Side => uint)) public betsPerGambler;

    
    
    
    
    function placeBet(Side _side,uint _Amount) public payable {
        require(ended == false, "Unfortunately accepting bets is over!!");
        bets[_side] += _Amount;
        betsPerGambler[msg.sender][_side] += _Amount;
        sideCounter[_side] += 1;
        counter += 1;
    }
    
    
    function claim() public {
        uint gamblerBet = betsPerGambler[msg.sender][result.WINNER];
        require(gamblerBet > 0, "You don't have any winning bet sir!!");
        require(ended = true, "Game is not over yet sir!");
        uint gain = gamblerBet + bets[result.LOSER] * gamblerBet / bets[result.WINNER];
        betsPerGambler[msg.sender][Side.A] = 0;
        betsPerGambler[msg.sender][Side.B] = 0;
        payable(msg.sender).transfer(gain);
    }
    
    
    
    function betClosed() public onlyOwner {
        ended = true;
    }
    
    
    function reportResult(Side _winner,Side _loser) public onlyOwner {
        require(ended = true, "Close accpeting the bets first sir!!");
        result.WINNER = _winner;
        result.LOSER = _loser;
    }
}
