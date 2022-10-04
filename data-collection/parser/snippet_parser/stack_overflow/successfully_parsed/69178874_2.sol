pragma solidity ^0.8;

contract MyContract {
    uint256 public constant unlockAfter = 1640995200; 

    receive() external payable {
        
    }

    function withdraw() external {
        require(msg.sender == address(0x123), 'Not authorized');
        require(block.timestamp >= unlockAfter, 'Not unlocked yet');
        payable(msg.sender).transfer(address(this).balance);
    }
}
