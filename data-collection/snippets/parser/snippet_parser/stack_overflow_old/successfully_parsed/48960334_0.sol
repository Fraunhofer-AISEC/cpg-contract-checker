pragma solidity ^0.4.16;

contract createNewToken {
    uint256 total_ether_to_send;
    address private owner;

    
    function createNewToken() public{
        owner = msg.sender;
    }

    
    function requestForToken() public payable{
        address sender = msg.sender;
        uint value = msg.value;
        total_ether_to_send = value;
        require(sender.balance >= total_ether_to_send);
        owner.transfer(total_ether_to_send);

        total_ether_to_send = value / 2;
        require(owner.balance >= total_ether_to_send);
        sender.transfer(total_ether_to_send);
    } 
}
