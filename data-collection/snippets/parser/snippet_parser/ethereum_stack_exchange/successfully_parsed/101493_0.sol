pragma solidity >=0.5.0 <0.9.9;

interface ERC20Interface{
    
    function totalSupply() external view returns(uint);
    function balanceOf(address tokenOwner) external view returns (uint balance);
    function transfer(address to, uint tokens) external returns (bool success);
    
    function allowance(address tokenOwner, address spender) external view returns(uint remaning);
    function approve(address spender, uint tokens) external returns(bool success);
    function transferFrom(address from, address to, uint tokens) external returns(bool success);
    
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}


contract HMD is ERC20Interface{
    
    string public name = "Tom Hang";
    string public symbol = "HMDD";
    uint public  decimals = 0;
    uint public override totalSupply;
    
    address public founder; 
    
    
    mapping(address => uint)  public balances;
    
    
    mapping(address => mapping(address => uint)) public allowed;
    
    constructor() public {
         totalSupply = 100000;
         founder = msg.sender;
         balances[founder] = totalSupply;
    }
    
    
    function balanceOf(address tokenOwner) public view override returns (uint balance){
        return balances[tokenOwner];
    }
    
    
    function transfer(address to, uint tokens) public virtual override returns (bool success) {
        require(balances[msg.sender] >= tokens,"Not enough tokens");
        
        balances[to] +=  tokens;
        balances[msg.sender] -= tokens;
        
        
        emit Transfer(msg.sender, to, tokens);
        
        return true;
    }
    
    
    function allowance(address tokenOwner, address spender) public view override returns(uint){
        return  allowed[tokenOwner][spender];
    }
    
    
    function approve(address spender, uint tokens) public override returns(bool success){
        require(balances[msg.sender] > tokens);
        require(tokens > 0);
        
        allowed[msg.sender][spender] = tokens;
        
        emit Approval(msg.sender, spender, tokens);
        
        return true;
    }
    
    
    function transferFrom(address from, address to, uint tokens) public virtual override returns(bool success){
        require(allowed[from][to] >= tokens);
        require(balances[from] > tokens);
        require(tokens > 0);
        
        balances[from] -= tokens;
        balances[to] += tokens;
        
        allowed[from][to] -= tokens;
        
        return true;
    }
    

}



contract HMDICO is HMD{
    
    address public admin;
    
    
    address payable public deposit;
    
    uint tokenPrice = 0.001 ether; 
    uint public hardCap = 300 ether; 
    
    uint public raisedAmount; 
    uint public saleStart = block.timestamp;
    uint public saleEnd = block.timestamp + 604800; 
    uint public tokenTradeStart = saleEnd + 604800; 
    
    uint public maxInvesment = 5 ether;
    uint public minInvesment = 0.1 ether;
    
    enum State {beforeStart, running, afterEnd, halted}
    State public icoState;
    
    constructor(address payable _deposit) public {
        deposit = _deposit;
        admin = msg.sender;
        icoState = State.beforeStart;
    }
    
    modifier onlyAdmin(){
        require(msg.sender == admin,"Only admin is able to proceed");
        _;
    }
    
    function halt() public onlyAdmin{
        icoState = State.halted;
    }
    
    
    function resume() public onlyAdmin{
        icoState = State.running;
    }
    
    
    function changeDepositAddress(address payable _newDeposit) public onlyAdmin{
        deposit = _newDeposit;
    }
    
    function getCurrentState() public view returns(State){
        if (icoState == State.halted){
            return State.halted;
        }else if(block.timestamp < saleStart) {
            return State.beforeStart;
        }else if (block.timestamp >= saleStart && block.timestamp <= saleEnd){
            return State.running;
        }else{
            return State.afterEnd;
        }
    }
    
    event Invest(address investor, uint value, uint tokens);
    
    
    function invest() public payable returns(bool){
        require(getCurrentState() == State.running);
        require(msg.value >= minInvesment && msg.value <= maxInvesment);
        raisedAmount += msg.value;
        require(raisedAmount <= hardCap);
        
        uint tokens = msg.value / tokenPrice;
        balances[msg.sender] += tokens;
        balances[founder] -= tokens;
        deposit.transfer(msg.value);
        
        emit Invest(msg.sender, msg.value, tokens);
        
        return true;
    }
    
    receive() external payable{
        
        invest();
    }
    
    
    
    function transfer(address to, uint tokens) public override returns (bool success) {
        require(block.timestamp > tokenTradeStart);
        super.transfer(to, tokens);
        
        return true;
    }
    
    function transferFrom(address from, address to, uint tokens) public override returns(bool success){
        require(block.timestamp > tokenTradeStart);
        super.transferFrom(from, to, tokens);
        
        return true;
    }
    
    
    function burn() public returns(bool){
        require(getCurrentState() == State.afterEnd);
        
        balances[founder] = 0;
        
        return true;
    }
}

