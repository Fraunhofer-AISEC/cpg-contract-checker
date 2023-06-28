

contract ABCToken {
    
    string public name;
    
    string public symbol;
    
    uint8 public decimals;
    
    uint256 public totalSupply;
    
    mapping(address => uint256) public balanceOf;
    
    address public owner;
    
    
    constructor() public {
        
        name = "ABC";
        
        symbol = "XYZ";
        
        decimals = 2;
        
        totalSupply = 100000;
        
        owner = msg.sender;
        
        balanceOf[owner] = totalSupply;
    }
    
    
    function issueTokens(uint256 _amount) public {
        
        require(msg.sender == owner, "Only the owner can issue more tokens");
        
        totalSupply += _amount;
        balanceOf[owner] += _amount;
    }
    
    
    function transfer(address _to, uint256 _amount) public {
        
        require(msg.sender == owner, "Only the owner can transfer tokens");
        
        require(balanceOf[owner] >= _amount, "Insufficient balance");
        
        balanceOf[owner] -= _amount;
        balanceOf[_to] += _amount;
    }
}
