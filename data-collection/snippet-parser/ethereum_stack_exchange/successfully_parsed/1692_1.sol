contract C1 {
    function f1() returns(bytes) {
        bytes memory bb = "\x00\x01\x02";  
        return(bb);
    }
}
