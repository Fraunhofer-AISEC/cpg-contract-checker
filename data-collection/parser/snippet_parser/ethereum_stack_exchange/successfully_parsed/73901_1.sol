pragma solidity ^0.5.1; 


contract Faucet {

    
    function withdraw(uint withdraw_amount) public {

        
        require(withdraw_amount < msg.sender.balance);

        
        msg.sender.transfer(withdraw_amount);

    }

    
    function () payable external {} 

    
    function getBalanceContract() public view returns(uint){
        return address(this).balance;
    }
}
