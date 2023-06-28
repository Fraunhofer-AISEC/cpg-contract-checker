function HowManyRepeated(string memory what, string memory where) public pure returns(uint){
    uint times = 0;
    if( ContainWord( what, where ) ){
        uint whatLen = CountUTF8String(what);
        uint whereLen = CountUTF8String(where);
        
        for (uint i = 0; i < whereLen - whatLen + 1 ; i++) {
            if( ContainWord( what, Substring( where, i , i + whatLen) ) ){
                times++;
            }
        }
    }
    return times;
}
