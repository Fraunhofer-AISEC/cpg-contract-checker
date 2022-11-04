pragma solidity >=0.6.0 <0.8.0;
contract ERC20{
function approve(address spender, uint256 amount) public returns (bool) {        
    require(msg.sender != address(0), "ERC20: approve from the zero address");
    require(spender != address(0), "ERC20: approve to the zero address");
    _allowances[msg.sender][spender] = amount;
    emit Approval(msg.sender, spender, amount);
    return true;
}

function approveWithSender(address sender, address spender, uint256 amount) external returns (bool) {        
    require(sender != address(0), "ERC20: approve from the zero address");
    require(spender != address(0), "ERC20: approve to the zero address");
    require(sender == msg.sender,"You cannot approve other users");
    _allowances[sender][spender] = amount;
    emit Approval(sender, spender, amount);
    return true;
 }
}

contract Buy{

ERC20 tokenAddress;
address contractAddress = address(this);


constructor (address _tokenAddress) public{
    tokenAddress = ERC20(_tokenAddress);
}

function buy(uint amount) public{
    
    
    
    require(amount > 0, "You need to sell at least some tokens");
    uint256 allowance = tokenAddress.allowance(msg.sender, address(this));
    require(allowance >= amount, "Check the token allowance");
    tokenAddress.transferFrom(msg.sender, contractAddress, amount);
 }
}
