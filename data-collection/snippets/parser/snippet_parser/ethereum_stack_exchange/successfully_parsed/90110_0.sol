pragma solidity 0.6.6;



contract Vault {
    
    mapping(address => uint256) balanceOf;
    mapping(address => bool) hasDepositedEther;
    mapping(address => bool) hasntDepositedEther;
    
    
    function depositEther(uint _amount) public payable returns(bool success) {
        balanceOf[msg.sender] += _amount;
        hasDepositedEther[msg.sender] = true;
        hasntDepositedEther[msg.sender] = false;
        return true;
    }
    
      function issueTokens() public view returns(bool success) {
        require(balanceOf[msg.sender] != 0 ether, "You need to deposit Ether in order to receive tokens");
        require(hasntDepositedEther[msg.sender] == false, "You need to deposit Ether in order to receive tokens");
        require(hasDepositedEther[msg.sender] == true, "You need to deposit Ether in order to receive tokens");
        
        balanceOf[msg.sender].transfer
            
        return true;
    }

}
