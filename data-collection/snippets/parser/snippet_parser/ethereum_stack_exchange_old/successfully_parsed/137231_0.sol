pragma solidity 0.8.10;




contract Challenge{

    address[] public winners;
    bool lock;

    function exploit_me(address winner) public{
        lock = false;

        msg.sender.call("");

        require(lock);
        winners.push(winner);
    }

    function lock_me() public{
        lock = true;
    }
}

