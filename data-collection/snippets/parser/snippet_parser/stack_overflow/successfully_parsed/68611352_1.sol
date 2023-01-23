

pragma solidity >=0.7.0 <0.9.0;


contract TestContract {
    
        
    function getsubstring1() public pure returns (string memory, uint256, string memory) {
        bytes32 hmacSha256 = 0xf83bf40815929b2448b230d51fa2eaa5b8ccffd87691db7e62bf817b2cbb56ad;
        bytes memory tempH = bytes(abi.encodePacked(hmacSha256));
        uint256 uintHash = uint256(hmacSha256);
        
        
        
        
        string memory _hs = '0xf83bf40815929'; 
        uint256 _h = 0xf83bf40815929;
        
        
        
        
        
        
        
        
        
        

        
        
        return (_hs, _h, _hs1);
    }
    
    function substring(string memory str, uint startIndex, uint endIndex) public pure returns (string memory) {
        bytes memory strBytes = bytes(str);
        bytes memory result = new bytes(endIndex-startIndex);
        for(uint i = startIndex; i < endIndex; i++) {
            result[i-startIndex] = strBytes[i];
        }
        return string(result);
    }
}
