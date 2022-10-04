pragma solidity ^0.8.0;

contract TestError {
    error TimeError(uint256 time);

    event LogTime(uint256 time);

    function getTimestampAsError() external {
        revert TimeError(block.timestamp);
    }

    function main() external {
        
        bytes memory data = abi.encodeWithSelector(this.getTimestampAsError.selector);
        (bool success, bytes memory returndata) = address(this).call(data);

        
        if (!success) {
            
            
            uint256 time;
            assembly {
                
                
                
                time := mload(add(returndata,0x24))
            }

            
            emit LogTime(time);
        }
    }
}
