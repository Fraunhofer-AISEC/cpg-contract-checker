pragma solidity ^0.4.21;

contract SimpleDividendToken {

    string public name = "Simple Dividend Token";
    string public symbol = "SDIV";

    
    uint8 public decimals = 0;   

    uint256 public totalSupply = 1000000 * (uint256(10) ** decimals);

    mapping(address => uint256) public balanceOf;

    function SimpleDividendToken() public {
        
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    mapping(address => uint256) dividendBalanceOf;

    uint256 public dividendPerToken;

    mapping(address => uint256) dividendCreditedTo;

    function update(address account) internal {
        uint256 owed =
            dividendPerToken - dividendCreditedTo[account];
        dividendBalanceOf[account] += balanceOf[account] * owed;
        dividendCreditedTo[account] = dividendPerToken;
    }

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    mapping(address => mapping(address => uint256)) public allowance;

    function transfer(address to, uint256 value) public returns (bool success) {
        require(balanceOf[msg.sender] >= value);

        update(msg.sender);  
        update(to);          

        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;

        emit Transfer(msg.sender, to, value);
        return true;
    }

    

    function deposit() public payable {
        dividendPerToken += msg.value / totalSupply;  
    }

    function withdraw() public {
        update(msg.sender);
        uint256 amount = dividendBalanceOf[msg.sender];
        dividendBalanceOf[msg.sender] = 0;
        msg.sender.transfer(amount);
    }

   

}
