pragma solidity ^0.4.0;

contract Crowdfunding {

    address private owner;

    mapping (address => uint) investors;

    
    function Crowdfunding() {
        owner = msg.sender;
    }

    
    modifier investorsOnly {
        if(investors[msg.sender] == 0) throw;
        _;
    }

    
    event PaymentReceived(uint Amount, address From, address To);
    event WithdrawalClaimed(uint Amount, address From);

    
    function() payable {
        investors[msg.sender] += msg.value;
        PaymentReceived(msg.value, msg.sender, this);
    }

    function withdrawFunds() {
        suicide(owner);
    }

    function getRefund() investorsOnly {
        uint amount = investors[msg.sender];
        investors[msg.sender] = 0;
        msg.sender.transfer(amount);
        WithdrawalClaimed(amount, msg.sender); 
    }
}
