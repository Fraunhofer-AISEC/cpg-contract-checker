pragma solidity ^0.4.23;

contract Payable {

    
    function() public payable {
        emit GotPaid(msg.value);
    }

    event GotPaid(uint256 value);
}
