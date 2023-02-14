pragma solidity 0.5.16;

contract Faucet {

    function withdraw(uint256 withdraw_amount) public   {    
        require(withdraw_amount <= 2000000);
        msg.sender.transfer(withdraw_amount);
        }

    
    function () external payable {}
}
