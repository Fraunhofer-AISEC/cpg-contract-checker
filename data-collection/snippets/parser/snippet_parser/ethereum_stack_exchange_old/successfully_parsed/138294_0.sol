

pragma solidity >=0.5.0 <0.9.0;






interface ERC20Interface {

    
    function totalSupply() external view returns (uint);
    function balanceOf(address tokenOwner) external view returns (uint balance);
    function transfer(address to, uint tokens) external returns (bool success);

    function allowance(address tokenOwner, address spender) external view returns (uint remaining);
    function approve(address spender, uint tokens) external returns (bool success);
    function transferFrom(address from, address to, uint tokens) external returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

}


contract Pennies is ERC20Interface {

    string public name = "Penny Pennies";
    string public symbol = "PENNY";
    uint public decimals = 0; 

    
    uint public override totalSupply;

    
    address public founder;

    
    mapping (address => uint) public balances;

    
    
    
    
    mapping(address => mapping(address => uint)) allowed;
    
    constructor(){

        
        totalSupply = 1000000;
        
        founder = msg.sender;
        
        balances[founder] = totalSupply;



    }

    
    function balanceOf(address tokenOwner) public view override returns (uint balance){

        return balances[tokenOwner];

    }

    
    function transfer(address to, uint tokens) public virtual override returns (bool success){

        
        require(balances[msg.sender] >= tokens);

        
        balances[to] += tokens;
        
        balances[msg.sender] -= tokens;
        
        emit Transfer(msg.sender, to, tokens);

        
        return true;

    }

    
    
    function allowance(address tokenOwner, address spender) public view override returns (uint){
        return allowed[tokenOwner][spender];
    }

    function approve(address spender, uint tokens) public override returns (bool success){

        
        require(balances[msg.sender] >= tokens);
        
        require(tokens > 0);

        
        
        allowed[msg.sender][spender] = tokens;

        
        emit Approval(msg.sender, spender, tokens);

        
        return true;

    }

    function transferFrom(address from, address to, uint tokens) public virtual override returns (bool){

        
        require(allowed[from][msg.sender] >= tokens);

        
        require(balances[from] >= tokens);

        
        balances[from] -= tokens;

        
        allowed[from][msg.sender] -= tokens;

        
        balances[to] += tokens;

        
        emit Transfer(from, to, tokens);

        
        return true;

    }

}


contract PennyICO is Pennies {

    
    address public admin;

    
    address payable public deposit;

    
    uint tokenPrice = 0.000001 ether;

    
    uint public hardCap = 300 ether;

    
    uint public raisedAmount;

    
    uint public saleStart = block.timestamp + 10;

    
    uint public saleEnd = block.timestamp + 3600 * 24 * 7;

    
    
    uint public tokenTradeStart = saleEnd + 604800;

    
    uint public maxInvestment = 5 ether;
    uint public minInvestment = 0.00001 ether;

    
    enum State {beforeStart, running, afterEnd, halted}

    
    State public ICOstate;

    
    constructor(address payable _deposit){
        deposit = _deposit;
        admin = msg.sender;
        ICOstate = State.beforeStart;
    }

    

    
    modifier onlyAdmin(){
        require(msg.sender == admin);
        _;
    }

    
    function halt() public onlyAdmin{
        ICOstate = State.halted;
    }

    
    function resume() public onlyAdmin{
        ICOstate = State.running;
    }

    
    function changeDepositAddress(address payable newDeposit) public onlyAdmin{

        deposit = newDeposit;

    }

    
    function getCurrentState() public view returns(State){
        if (ICOstate == State.halted){
            return State.halted;
            } else if (block.timestamp < saleStart){
                return State.beforeStart;
            } else if (block.timestamp >= saleStart && block.timestamp <= saleEnd){
                return State.running;
            } else {
                return State.afterEnd;
            }
    
    }

    
    event Invest(address investor, uint value, uint tokens);

    
    function invest() payable public returns(bool){

        
        ICOstate = getCurrentState();

        
        require(ICOstate == State.running);

        
        require(msg.value >= minInvestment && msg.value <= maxInvestment);

        
        raisedAmount += msg.value;

        
        require(raisedAmount <= hardCap);

        
        uint tokens = msg.value / tokenPrice;

        
        balances[msg.sender] += tokens;
        balances[founder] -= tokens;

        
        deposit.transfer(msg.value);

        
        emit Invest(msg.sender, msg.value, tokens);

        
        return true;

    }

    
    
    receive() payable external{
        invest();
    }



     
     
    function transfer(address to, uint tokens) public override returns (bool success){

        
        require(block.timestamp > tokenTradeStart);

        
        Pennies.tranfer(to, tokens);

        
        return true;

    }

    function transferFrom(address from, address to, uint tokens) public override returns (bool){

        require(block.timestamp > tokenTradeStart);
        Pennies.transferFrom(from, tokens);
        return true;

    }

}

