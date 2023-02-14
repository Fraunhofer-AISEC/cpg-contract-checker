function testStr(string str) public pure returns (bool){
    bytes memory b = bytes(str);
    if(b.length > 13) return false;

    for(uint i; i<b.length; i++){
        bytes1 char = b[i];

        if(
            !(char >= 0x30 && char <= 0x39) && 
            !(char >= 0x41 && char <= 0x5A) && 
            !(char >= 0x61 && char <= 0x7A) && 
            !(char == 0x2E) 
        )
            return false;
    }

    return true;
}
