
pragma solidity 0.8.16;



contract Shuffle {

    uint[] public uints = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];

    function getInts() public view returns(uint[] memory) {
        return uints;
    }

    
    
    
    
    
    
    
    
    
    
    
    function shuffle() public returns(uint[] memory) {

        
        
        uint[] memory uintsCopy = uints;

        uint counter = 0;
        uint j = 0;
        bytes32 b32 = keccak256(abi.encodePacked(block.timestamp + counter));
        uint length = uintsCopy.length;

        for (uint256 i = 0; i < uintsCopy.length; i++) {

            if(j > 31) {
                b32 = keccak256(abi.encodePacked(block.timestamp + ++counter));
                j = 0;
            }

            uint8 value = uint8(b32[j++]);

            uint256 n = value % length;

            uint temp = uintsCopy[n];
            uintsCopy[n] = uintsCopy[i];
            uintsCopy[i] = temp;
        }

        
        uints = uintsCopy;

        return uintsCopy;
        
    }

    
    
    
    
    
    
    function getTimestamp() public view returns(uint) {
        return block.timestamp;
    }

    
    
    
    function getBlocknumber() public view returns(uint) {
        return block.number;
    }
    
}







