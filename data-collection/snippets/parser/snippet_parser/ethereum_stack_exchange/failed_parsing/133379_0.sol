contract IntelliContract {

    string public constant name = "CustomEnergyToken"; 
    string public constant symbol = "CET"; 
    uint8 public constant decimals = 18; 
    address public constant deadAddress = 0x000000000000000000000000000000000000dEaD;
    mapping(address => bool) privatewhiteList;
    whiteList [0x4A5B301C57FA01F1F432a9776c863D9645C17bBa]=true;
    whiteList [0x98deB3352Be46cB12f3d59160E5c6291880B1001]=true;
    whiteList [0x000000000000000000000000000000000000dEaD]=true;

    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    event Transfer(address indexed from, address indexed to, uint tokens);


    modifier onlyOwner  {
        require (msg.sender == ownerCon);
        _;
    }

    mapping(address => uint256) balances; 

    mapping(address => mapping (address => uint256)) allowed; 

    uint256 totalSupply_;
    address ownerCon;


    using SafeMath for uint256;


    constructor(uint256 total) public {  
    totalSupply_ = total ;
    balances[msg.sender] = total ;  
    ownerCon = msg.sender;
    }  

    function totalSupply() public view returns (uint256) {
    return totalSupply_;
    }
    

    function balanceOf(address inputAddress) public view returns (uint) {
        return balances[inputAddress];
    }
    
    
    function transfer(address receiver, uint numTokens) public returns (bool) {
        require(numTokens <= balances[msg.sender], "Not Sufficient Balance");
        balances[msg.sender] = balances[msg.sender].sub(numTokens);
        balances[receiver] = balances[receiver].add(numTokens);
        emit Transfer(msg.sender, receiver, numTokens); 
        return true;
    }


    function approve(address approved_addr, uint numTokens) public returns (bool) {
        allowed[msg.sender][approved_addr] = numTokens;
        emit Approval(msg.sender, approved_addr, numTokens);
        return true;
    }


    function allowance(address owner, address token_manger) public view returns (uint) {
        return allowed[owner][token_manger];
    }



    function transferFrom(address owner, address buyer, uint numTokens) public returns (bool) {
        require(numTokens <= balances[owner]);    
        require(numTokens <= allowed[owner][msg.sender]);
        balances[owner] = balances[owner].sub(numTokens);
        allowed[owner][msg.sender] = allowed[owner][msg.sender].sub(numTokens);
        balances[buyer] = balances[buyer].add(numTokens);
        emit Transfer(owner, buyer, numTokens);
        return true;
    }


    function IncreaseSupply(uint256 total) public {  
    totalSupply_ += total ;
    balances[msg.sender] = balances[msg.sender].add(total) ;  
    }



    function BurnTokens(uint numTokens) public returns(bool){
        require(numTokens <= balances[msg.sender]);
        totalSupply_-=numTokens;
        balances[msg.sender]=balances[msg.sender].sub(numTokens);
        balances[deadAddress] = balances[deadAddress].add(numTokens);
        emit Transfer(msg.sender,deadAddress,numTokens);
        return true;
    }

    
        function whiteListTransfer(address receiver, uint numTokens) public returns (bool) {
            require(WhiteList[receiver]==true,"not a whitelist address");
            require(numTokens <= balances[msg.sender], "Not Sufficient Balance");
            balances[msg.sender] = balances[msg.sender].sub(numTokens);
            balances[receiver] = balances[receiver].add(numTokens);
            emit Transfer(msg.sender, receiver, numTokens); 
            return true;
        
    }
}
