contract A {

    
    function deepStack
    (
        uint8 _a,
        uint8 _b,
        uint8 _c,
        uint8 _d,
        uint16 _e,
        uint16 _f,
        uint16 _g,
        uint16 _h,
        uint32 _i,
        uint32 _j,
        uint32 _k,
        uint32 _l,
        uint64 _m,
        uint64 _n,
        uint64 _o,
        uint64 _p,
        uint128 _q
    )
        public
        returns (bool success)
    {
        return true;
    }

    
    function deepStackSolution
    (
        uint8[] _aToD,
        uint16[] _eToH,
        uint32[] _iToL,
        uint64[] _mToP,
        uint128 _q
    )
        public
        returns (bool success)
    {
        return true;
    }

}
