contract Test {
    public c = 3;
    function A(uint a) returns(uint){
    
       uint b = a - c;
       return b;
    }
    
    function B() returns(uint){
       return b + a;
    }
    
}
