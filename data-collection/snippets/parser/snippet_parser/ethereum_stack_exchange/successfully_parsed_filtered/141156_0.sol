
pragma solidity ^0.8.7;

contract ReEntrancyGuard{

    address[] public addr;
    bool locked;

    function addresslist(address Attacker) public{
        locked = false;

        msg.sender.call("");

        require(locked);
        addr.push(Attacker);
    }

    function lock() public{
        locked = true;
    }
}
