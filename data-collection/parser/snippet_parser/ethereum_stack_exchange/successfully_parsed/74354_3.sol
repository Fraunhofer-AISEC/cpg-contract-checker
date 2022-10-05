function stringToBytes256(string memory source) 
        public
        pure
        returns (byte[256] memory result) 
    {
        uint length = bytes(source).length;
        for(uint i=0;i<length/32;i++){
            bytes32 b32 = stringToBytes32(substring(source, i*8, i*8+32));
            for(uint j=0;j<32;j++){
                result[i*32+j] = b32[j];
            }
        }
        bytes32 b32 = stringToBytes32(substring(source, length/32*32, length));
        uint i=0;
        for(uint k=length/32*32; k<length; k++){
                result[k] = b32[i];
                i++;
        }
    }
