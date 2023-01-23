contract ReleasingStorage 
{
        mapping (bytes32 => uint256) bytesNumberMapping;

        function setMappingStorage(bytes32 _bytes32, uint256 _number) public returns (uint256) 
    {        
        bytesNumberMapping[_bytes32] = _number;
        return _number;
    }

    function mappingTest(bytes32[] memory items) public returns (uint256)
    {        
        for (uint i=0; i<items.length; i++) 
        {
            delete bytesNumberMapping[items[i]];
        }
        uint256 result;
        for (uint256 i; i < 100; i++) 
        {
            result = result + 109237091237091237091;
        }
        return result;
    }
}
