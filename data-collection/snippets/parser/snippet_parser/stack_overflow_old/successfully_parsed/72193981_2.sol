
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/access/Ownable.sol';

contract AdEth is Ownable {


    uint _start;
    uint _end;
    uint cooldownTime = 3 minutes;
    uint runNumber = 0;

    function start() internal {
        _start = block.timestamp;
        _end = block.timestamp + cooldownTime;
        runNumber++;
    }

    function getTimeLeft() public view returns(uint) {
        return _end - block.timestamp;
    }


    function adRunNumber() public view returns (uint) {
        return runNumber;
    }

    function receiveAdPayment() payable public {
        require(msg.value >= 0.05 ether, "At Least 0.05 ETH Needed.");
        require(block.timestamp > _end, "There is currently an ad running. Please wait until the cooldown is finished.");
        start();
    }

    function withdraw(uint _amount) external onlyOwner {
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
