pragma solidity 0.6.6;

import "./SafeMath.sol";



contract Vault is FreezeFunction{
    
    using SafeMath for uint;
    
    mapping(address => uint256) public vaultBalance;
    mapping(address => bool) public hasDepositedEther;
    mapping(address => bool) public isStaking;  
 
    event Withdrawal(address indexed src, uint _ethAmount);
    

    
    function depositEther(uint _ethAmount) public payable returns(bool success) {
        require(_ethAmount > 0 ether, "Cannot be 0");
 
        address(this).transfer(_ethAmount);
        vaultBalance[msg.sender] = vaultBalance[msg.sender].add(_ethAmount);

        hasDepositedEther[msg.sender] = true;
        isStaking[msg.sender] = false;
        return true;
    }
    
        
    function withdrawEther(uint _ethAmount) public returns(bool success) {
        require(vaultBalance[msg.sender] != 0, "No funds to withdraw");
        require(isStaking[msg.sender] != true, "Cannot withdraw eth while staking");
        require(vaultBalance[msg.sender] >= _ethAmount, "Not enough funds to withdraw");
        
        vaultBalance[msg.sender] = vaultBalance[msg.sender].sub(_ethAmount);
        msg.sender.transfer(_ethAmount);
        
        emit Withdrawal(msg.sender, _ethAmount);
        return true;
    }
    
    function contractBal() public view returns(uint bal) {
        bal = address(this).balance;
        return bal;
    }
    
    
    receive() external payable {}
}
