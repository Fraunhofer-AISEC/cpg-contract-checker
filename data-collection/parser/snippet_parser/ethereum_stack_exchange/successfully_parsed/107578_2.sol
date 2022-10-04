library L {
    enum E {A, B, C}
    struct S { address[50] addresses; }

    function f(
        uint a,
        string memory b,
        bytes1[] calldata c,
        mapping(E => S[]) storage d,
        function() external e
    )
    public
    returns (
        uint,
        string memory,
        bytes1[] calldata,
        mapping(E => S[]) storage,
        function() external
    )
    {
        return (a, b, c, d, e);
    }
}
