contract C1 {
    uint public _n;  

    function foo(uint n) returns(uint) {
        _n = n;
        return _n;
    }

    function invoke(bytes4 methodId, uint n) returns(bool) {
        return this.call(methodId, n);
    }
}
