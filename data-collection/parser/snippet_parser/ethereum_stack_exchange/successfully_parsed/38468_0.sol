contract Root {

    
    
    function nthRoot(uint _a, uint _n, uint _dp, uint _maxIts) pure public returns(uint) {
        assert (_n > 1);

        
        
        
        uint one = 10 ** (1 + _dp);
        uint a0 = one ** _n * _a;

        
        uint xNew = one;

        uint iter = 0;
        while (xNew != x && iter < _maxIts) {
            uint x = xNew;
            uint t0 = x ** (_n - 1);
            if (x * t0 > a0) {
                xNew = x - (x - a0 / t0) / _n;
            } else {
                xNew = x + (a0 / t0 - x) / _n;
            }
            ++iter;
        }

        
        return (xNew + 5) / 10;
    }
}
