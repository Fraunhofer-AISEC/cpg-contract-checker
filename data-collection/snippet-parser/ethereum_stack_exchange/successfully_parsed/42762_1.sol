pragma solidity ^0.4.21;

contract Mutex {
    bool locked;
    modifier noReentrancy() {
        require(!locked);
        locked = true;
        _;
        locked = false;
    }

    function Mutex() public payable { }

    function canBeAttacked() public returns (uint) {
        require(msg.sender.call.value(1 ether)());
        return 7;
    }

    
    function f() public noReentrancy returns (uint) {
        require(msg.sender.call());
        return 7;
    }
}

contract Attacker {
    function () public payable {
        if (msg.sender.balance >= 1 ether) {
            Mutex(msg.sender).canBeAttacked();
        }
    }

    function payment(Mutex mutex) public {
        mutex.canBeAttacked();
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
