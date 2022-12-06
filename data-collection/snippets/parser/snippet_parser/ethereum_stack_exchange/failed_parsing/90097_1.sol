contract Test {
    public c = 3;
    function A(uint a) returns(uint){

       uint b = a - C();
       return b;
    }

    function B() returns(uint){
       return b + a;
    }
    
    function C() returns(uint) {
       return c * 2;
    }
}
