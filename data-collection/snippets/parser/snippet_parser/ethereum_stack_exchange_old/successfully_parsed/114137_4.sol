contract SelectorsPublic {
    
    bool public called;
    
    function otherFunc(bool _called) public {
        called =_called; 
    }
}
