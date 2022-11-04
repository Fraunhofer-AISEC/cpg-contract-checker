pragma solidity ^0.8;

contract ERC20Basic{
    uint256 public constant tokenPrice = 5; 
    
    function buy(uint256 _amount) external payable {
        
        require(msg.value == _amount * tokenPrice, 'Need to send exact amount of wei');
        
        
        transfer(msg.sender, _amount);
    }
    
    function sell(uint256 _amount) external {
        
        balances[msg.sender] -= _amount;
        increment the token balance of this contract
        balances[address(this)] += _amount;

        
        emit Transfer(msg.sender, address(this), _amount);
        
        
        payable(msg.sender).transfer(amount * tokenPrice);
    }
}
