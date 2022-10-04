
pragma solidity ^0.8.0;

contract AdEth {


    address payable public owner;
    uint _start;
    uint _end;
    uint cooldownTime = 1 minutes;

    constructor() {
        owner = payable(msg.sender);
    }

    modifier timerOver {
        require(block.timestamp <= _end, "The Cooldown is over");
        _;
    }

    modifier onlyWhileOpen {
        require(block.timestamp >= _start && block.timestamp <= _end);
        _;
    }

    function start() public {
        _start = block.timestamp;
        end(cooldownTime);
    }

    function end(uint totalTime) public {
        _end = totalTime + _start;
    }

    function getTimeLeft() public view returns(uint) {
        return _end - block.timestamp;
    }

    receive() external payable {
        
    }

    function receiveAdPayment() payable public returns (bool) {
        require(msg.value == 0.05 ether, "Not enough ether. 0.05 Needed.");
        require(cooldownTime == 0, "There is currently an add running. Please wait until the cooldown is finished.");
        msg.sender.transfer(0.05 ether);
        start();
        return true;
    }

    function withdrawAll(uint _amount) external {
        require(msg.sender == owner, "Caller is not the owner.");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
