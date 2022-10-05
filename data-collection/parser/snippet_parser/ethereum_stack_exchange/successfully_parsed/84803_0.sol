pragma solidity 0.6.0;

contract Hello {

    function withdraw() external {
        uint256[] memory blocktimes = getBlocktimes();
        uint256[] storage myArray;

        for (uint256 i = 0; i < blocktimes.length; i++) {
            if (blocktimes[i] <= block.timestamp) {
                
            } else {
                myArray.push(blocktimes[i]);
            }
        }

        if (myArray.length > 0) {
            
            delete myArray;
        }
    }
}
