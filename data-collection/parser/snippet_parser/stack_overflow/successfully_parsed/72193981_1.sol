
pragma solidity ^0.8.0;

contract AdEth {


    address payable public owner;
    uint _start;
    uint _end;

    uint cooldownTime = 4;
    bool running;

    constructor() {
        owner = payable(msg.sender);
    }

    function start() internal {
        _start = block.number;
        _end = block.number + cooldownTime;
        running = true;
    }


    function getTimeLeft() public view returns(uint) {
        return _end - block.number;
    }



    function setRunning() public {
        require(msg.sender == owner, "You are not the owner.");
        require(block.number > _end, "Wait for the cooldown to expire before you can reset running to false.");
        running = false;
    }

    function isRunning() public view returns (bool) {
        return running;
    }

    function receiveAdPayment() payable public {
        require(msg.value >= 0.05 ether, "At Least 0.05 ETH Needed.");
        require(block.number > _end, "There is currently an ad running. Please wait until the cooldown is finished.");
        require(running != true, "The ad time may have run out, but has not been reset by Admin.");
        start();
    }

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "Caller is not the owner.");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
