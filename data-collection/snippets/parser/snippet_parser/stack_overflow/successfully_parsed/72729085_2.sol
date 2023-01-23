
pragma solidity ^0.8.0;

contract ERC20 {
    uint256 public totalSupply;
    string public name;
    string public symbol;
   

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;


    constructor(string memory name_, string memory symbol_) {
        name = name_;
        symbol = symbol_;
        _mint(msg.sender, 100e18);
    } 

    function decimals() external pure returns (uint8) {
        return 18;
    }

    function transfer(address recipient, uint256 amount) external returns (bool) {
            return _transfer(msg.sender, recipient, amount);
            
    }

    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool) {

        uint256 currentAllowance = allowance[sender][msg.sender];

        require(currentAllowance >= amount, "ERC20: Transfer amount exceeds allowance" ) ;

        allowance[sender][msg.sender] = currentAllowance - amount;

        return _transfer(sender, recipient, amount);
            
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        allowance[msg.sender][spender] = amount;
        return true;
    }

    function _transfer(address sender, address recipient, uint256 amount) private returns (bool) {
            require(recipient != address(0), "ERC20: transfer to zero address");
            uint256 senderBalance = balanceOf[sender];
            require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");
            balanceOf[sender] = senderBalance - amount;
            balanceOf[recipient] += amount;

            return true;
            
    }

    function _mint(address to, uint256 amount) internal {
        require(recipient != address(0), "ERC20: transfer to zero address");
        totalSupply += amount;
        balanceOf[to] +=amount;
    }
 
}
