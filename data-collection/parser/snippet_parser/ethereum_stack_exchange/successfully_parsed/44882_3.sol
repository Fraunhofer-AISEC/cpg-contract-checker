contract string_test {

    function string_tobytes( string s) constant returns (bytes){
        bytes memory b3 = bytes(s);
        return b3;
    }
}
