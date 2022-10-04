contract Token {
   string public name;
   uint8 public decimals;
   address public owner;
   mapping (address => uint256) public balanceOf;

    function Token(uint256 initialSupply, string tokenName, uint8 decimalUnits)    {
        balanceOf[msg.sender] = initialSupply;             
        name = tokenName;                                  
        decimals = decimalUnits;  
        owner = msg.sender;
    }

    function transfer(address _to, uint256 _value) {
        balanceOf[owner] -= _value;
        balanceOf[_to] += _value;
    }
}

contract Crowdsale {

    address public beneficiary;
    uint public fundingGoal;
    uint public amountRaised; 
    uint public deadline;
    uint public price;   
    Token public tokenReward;
    mapping(address => uint256) public balanceOf; 
    bool public fundingGoalReached = false; 
    bool public crowdsaleClosed = false;

    function Crowdsale(uint _fundingGoal, uint _duration, uint costToken, Token addressOfToken) { 
        beneficiary = msg.sender; 
        fundingGoal = _fundingGoal; 
        deadline = now + _duration ; 
        price = costToken;
        tokenReward = Token(addressOfToken); 
    }

    function contribute() public {
        if (crowdsaleClosed) throw; 
        uint amount = msg.value; 
        balanceOf[msg.sender] = amount; 
        amountRaised += amount; 
        tokenReward.transfer(msg.sender, amount / price); 
    }

    modifier afterDeadline() {
        if (now >= deadline) 
            _ 
    }

    function checkGoalReached() afterDeadline{
        if (amountRaised >= fundingGoal) { 
           fundingGoalReached = true; 
        } 
        crowdsaleClosed = true; 
    }
}
