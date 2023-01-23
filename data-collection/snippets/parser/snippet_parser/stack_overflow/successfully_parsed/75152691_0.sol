contract Token2 {
    uint a = 1; 

    function foo2(uint b) external {
        for (uint i = 0; i < 10; ++i)
            a += b;
    }
}
