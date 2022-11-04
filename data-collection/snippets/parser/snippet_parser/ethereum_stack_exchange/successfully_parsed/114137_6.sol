contract SelectorsInternal {
    
    bool public called;
    
    function otherFunc(bool _called) internal {
        called =_called; 
    }
}
