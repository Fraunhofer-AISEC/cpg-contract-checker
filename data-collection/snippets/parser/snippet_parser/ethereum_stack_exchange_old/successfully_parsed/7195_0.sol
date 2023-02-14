contract C {
    function C() {}

    struct S {
        address creator;
    }

    mapping(string => S) M;
    uint x;

    function set(string _hash) {
        S memory N = S({
            creator : msg.sender
        });

        M[_hash] = N; 
        x = _hash; 
    }

    function get(string _hash) returns (address addr) {
        return M[_hash].creator;
    }
}
