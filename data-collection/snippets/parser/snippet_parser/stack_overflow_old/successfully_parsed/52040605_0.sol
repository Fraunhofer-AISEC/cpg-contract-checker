contract Test1 {
    int128 public val;    
    function getVal() view public returns(int128) {
        return val;
    }    
    function setVal( int128 _val ) public {
        val = _val;
    }
}

contract Test2 {
    address public the1;    
    function setTest1( address _adr ) public {
        the1 = _adr;
    }    
    function setVal( int128 _val ) public {
        Test1( the1 ).setVal( _val );
    }    
    function getVal() view public returns(int128) {
        return Test1( the1 ).getVal();
    }    
}
