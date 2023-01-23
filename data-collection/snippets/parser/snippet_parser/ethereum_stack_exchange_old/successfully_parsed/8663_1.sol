library lib_external {
    struct LStruct { uint i; }
    function L_i (LStruct storage _s) public {
        _s.i++;
    }
}