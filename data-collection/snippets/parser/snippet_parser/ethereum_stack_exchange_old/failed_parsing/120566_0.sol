contract Test {

    struct Bar {
        uint a;
        uint b;
        bool c;
    }

    Bar public z;
    string public y;

    function foo(string s, Bar[] memory b) public {
        y = s;
        ...
    }

}
