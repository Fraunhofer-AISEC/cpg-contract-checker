pragma solidity ^0.8.5;

contract MyToken {
    mapping (address => uint256) lastReceived;
    
    function transfer(address _to, uint256 _amount) external {
        uint256 fee = getFee(msg.sender);

        
        
        updateLastReceived(_to);
    }
    
    function getFee(address _sender) internal returns (uint256) {
        if (block.timestamp - lastReceived[_sender] < 1 days) {
            
            return 100;
        }

        return 0;
    }
    
    function updateLastReceived(address _receiver) internal {
        lastReceived[_receiver] = block.timestamp;
    }
}
