contract Memsize {
    function foo(uint _its) pure public returns (uint) {
        uint ms;
        uint[] memory a;
        for (uint i = 0; i < _its; ++i) {
            a = new uint[](100);
            delete a;
        }
        assembly{
            ms := msize()
        }
        return(ms);
    }
}
