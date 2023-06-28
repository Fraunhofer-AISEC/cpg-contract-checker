

pragma solidity ^0.8.0;


contract Token {
    
    mapping (address => uint256) public balanceOf;

    
    string public name = "DemoCoin";
    string public symbol = "DC";
    uint8 public decimals = 8;
    uint256 public totalSupply = 1000000000 * (uint256(10) ** decimals);
    address public owner;
    
    
    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor()  {
        
        owner = msg.sender;
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }
    
    
    
    
    
    
    
    
        
    
    
    function buyTokens() public payable {
        
        
        uint paidAmount;
        
        require(balanceOf[msg.sender] >= paidAmount);
        require(balanceOf[owner] >= value);
        uint tokens;
        tokens = value/10e14;
        balanceOf[owner] -= tokens;
        balanceOf[msg.sender] += tokens;
        emit Transfer(owner, msg.sender, tokens);
    }
    
    function msgSenderBalancce() public view returns (uint) {
        return balanceOf[msg.sender];
    }
    
    function withDrawEth() public view {
        require(msg.sender == owner);
        
        
    }

}
