library lib_internal {
    struct LStruct { uint i; }
    function L_i (LStruct storage _s) internal {
        _s.i++;
    }
}