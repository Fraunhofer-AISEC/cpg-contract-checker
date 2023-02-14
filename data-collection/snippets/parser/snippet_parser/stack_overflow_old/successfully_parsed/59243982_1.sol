function bytesToBytes32Array(bytes memory data)
    public
    pure
    returns (bytes32[] memory)
{
    
    uint256 dataNb = data.length / 32;
    
    bytes32[] memory dataList = new bytes32[](dataNb);
    
    uint256 index = 0;
    
    for (uint256 i = 32; i <= data.length; i = i + 32) {
        bytes32 temp;
        
        assembly {
            temp := mload(add(data, i))
        }
        
        dataList[index] = temp;
        index++;
    }
    
    return (dataList);
}
