pragma solidity ^0.4.0;

contract Test {
    bool public projectPaid = false;
    uint public amountRaised = 0;

    function payout() returns (uint) { 
        if (projectPaid) return 3;
        projectPaid = true;
        if (!msg.sender.send(amountRaised)) { 
            projectPaid = false;
            return 4; 
        }
        return 5; 
    }
}
