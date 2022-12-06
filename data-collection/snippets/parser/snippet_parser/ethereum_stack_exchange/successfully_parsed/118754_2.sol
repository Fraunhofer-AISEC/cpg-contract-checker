contract A {
    function a() public {
        uint myNumber;
        for (uint i=0; i<10; i++) {
            myNumber = i*i;
        }
    }

    function b() public {
        for (uint i=0; i<10; i++) {
            uint myNumber = i*i;
        }
    }
}
