
  address public homeBet;  
  address public awayBet;

    mapping (address => uint256) public amountStore;

    event LogDeposit(address sender, uint amount, string executed);

    function deposit(uint team) public payable returns(bool success) {
        if(team == 1)
        {
        homeBet = msg.sender;
        amountStore[msg.sender] += msg.value;
        emit LogDeposit(msg.sender, msg.value, "Executed deposit HOME");
        oraclize_query("URL", "json(https://api.crowdscores.com/v1/matches/123945?api_key=).outcome.winner");
        return true;
        }
        else if(team == 2)
        {
        awayBet = msg.sender;
        amountStore[msg.sender] += msg.value;
        emit LogDeposit(msg.sender, msg.value, "Executed deposit AWAY");
        oraclize_query("URL", "json(https://api.crowdscores.com/v1/matches/123945?api_key=).outcome.winner");
        return true; 
        }
    }

