contract C {
    struct S {
        uint n;
    }

    
    mapping (uint => S) m;

    
    function localToGobal(uint i) public {
        S storage obj = S(i);
        m[i] = obj;
    }
}