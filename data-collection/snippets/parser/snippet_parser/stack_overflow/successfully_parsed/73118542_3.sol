pragma solidity ^0.8;

import "@openzeppelin/contracts/access/Ownable.sol";

contract MyContract is Ownable {
    uint256 lastPingTimestamp;

    
    function ping() public onlyOwner {
        lastPingTimestamp = block.timestamp;
    }

    
    function claimOwnership() public {
        
        require(lastPingTimestamp < block.timestamp - 356 days);

        
        _transferOwnership(msg.sender);
        lastPingTimestamp = block.timestamp;
    }
}
