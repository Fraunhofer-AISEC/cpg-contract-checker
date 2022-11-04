pragma solidity 0.6.3;

contract Hello {
    
    uint256[] myArray;
    
    function withdraw() external {
        uint256[2] memory blocktimes = getBlocktimes();

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
    
    function getBlocktimes() private pure returns(uint256[2] memory) {
        return [uint256(10000000000),uint256(10000000000)];
    }
}
