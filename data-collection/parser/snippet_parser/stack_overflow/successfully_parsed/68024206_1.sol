pragma solidity ^0.8;

contract MyContract {
    uint256 lastRun;

    function myFunction() external {
        require(block.timestamp - lastRun > 5 minutes, 'Need to wait 5 minutes');

        

        lastRun = block.timestamp;
    }
}
