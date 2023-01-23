pragma solidity 0.4;

contract LockBox {
    uint256 delaySeconds;
    uint256 unlockTime;
    address owner;

    function LockBox(uint256 _delay) {
        delaySeconds = _delay;
        owner = msg.sender;
    }

    
    function () payable {
        if (this.balance != 0)
            throw;
        if (msg.value != 10000) 
            throw;
        unlockTime = now + delaySeconds;
    }

    
    function withdraw() {
        if (now <= unlockTime)
            throw;
        if (msg.sender != owner)
            throw;
        owner.transfer(this.balance);
    }
}
