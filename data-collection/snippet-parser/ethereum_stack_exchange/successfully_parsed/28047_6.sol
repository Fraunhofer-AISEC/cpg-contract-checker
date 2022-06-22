    
    function createArr1(uint _n, uint _m, uint _k) external pure returns(uint[] memory) {
        uint[] memory a = new uint[](3);
        a[0] = _n;
        a[1] = _m;
        a[2] = _k;
        return a;
    }
    
    function createArr2(uint _n, uint _m, uint _k) external pure returns(uint[3] memory) {
        uint[3] memory a = [_n, _m, _k];
        return a;
    }
