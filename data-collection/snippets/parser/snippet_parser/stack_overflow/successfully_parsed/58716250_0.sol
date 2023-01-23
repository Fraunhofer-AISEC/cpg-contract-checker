pragma solidity ^0.5.11;


contract Faucet
{


 function deposit(uint256 amount) payable public {
     require(msg.value == amount);
    
}



function withdraw(uint256 withdraw_amount) public
{
    if(withdraw_amount <= address(this).balance)
    {
        
        msg.sender.transfer(withdraw_amount);

    }

}

}
