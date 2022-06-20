contract HashTextMap {
    
    mapping(string=>string) textMap;
    
    
    function set(string memory text) public   {
        bytes32 val;
        val = sha256(abi.encodePacked(text));
        uint256 i = uint(val);
        string memory key = uint2str(i);
        textMap[key] = text;            
    }

    function get(string memory key) public view returns(string memory) {
        return textMap[key];
    }
    
    function hash(string memory text) public pure returns(string memory) {
        bytes32 val;
        val = sha256(abi.encodePacked(text));
        uint ival = uint(val);
        string memory key = uint2str(ival);
        return key;            
    }
    
    function uint2str( uint256 i ) internal pure returns (string memory str) {
        if (i == 0) { return "0";}
        uint256 j = i;
        uint256 length;
        while (j != 0) {
            length++;
            j /= 10;
        }
        bytes memory bstr = new bytes(length);
        uint256 k = length;
        j = i;
        while (j != 0) {
            bstr[--k] = bytes1(uint8(48 + j % 10));
            j /= 10;
        }
        str = string(bstr);
        return str;
    }
}