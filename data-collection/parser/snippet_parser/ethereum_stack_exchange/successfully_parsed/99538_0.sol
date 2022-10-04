function uploadMetaDataToServer(uint256 tokenID, address creator) external returns (bytes32 requestId) 
{
    Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
  

        string memory finalURL = strConcat('https://baseURL.com/dev/nft/metadata/',addressToString(creator),'/',uint2str(tokenID)); 
        
    request.add("get", finalURL );
    request.add("path", "CREATED");
    
 
     sendChainlinkRequestTo(oracle, request, fee);
}

function addressToString(address _address) internal pure returns(string memory) {
   bytes32 _bytes = bytes32(uint256(_address));
   bytes memory HEX = "0123456789abcdef";
   bytes memory _string = new bytes(42);
   _string[0] = '0';
   _string[1] = 'x';
   for(uint i = 0; i < 20; i++) {
       _string[2+i*2] = HEX[uint8(_bytes[i + 12] >> 4)];
       _string[3+i*2] = HEX[uint8(_bytes[i + 12] & 0x0f)];
   }
   return string(_string);
}
function uint2str(uint256 _i) internal pure returns (string memory _uintAsString) {
    if (_i == 0) {
        return "0";
    }
    uint256 j = _i;
    uint len;
    while (j != 0) {
        len++;
        j /= 10;
    }
    bytes memory bstr = new bytes(len);
    uint k = len - 1;
    while (_i != 0) {
        bstr[k--] = byte(uint8(48 + _i % 10));
        _i /= 10;
    }
    return string(bstr);
}



function strConcat(string memory _a, string memory _b , string memory _c, string memory _d ) internal pure returns (string memory){

    bytes memory _ba = bytes(_a);
    bytes memory _bb = bytes(_b);
    bytes memory _cc = bytes(_c);
    bytes memory _dd = bytes(_d);



string memory abcde = new string(_ba.length + _bb.length + _cc.length + _dd.length);
bytes memory babcde = bytes(abcde);
uint k = 0;
for (uint i = 0; i < _ba.length; i++) babcde[k++] = _ba[i];
for (uint i = 0; i < _bb.length; i++) babcde[k++] = _bb[i];
for (uint i = 0; i < _cc.length; i++) babcde[k++] = _cc[i];
for (uint i = 0; i < _dd.length; i++) babcde[k++] = _dd[i];
return string(babcde);
}
