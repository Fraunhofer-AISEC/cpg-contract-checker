function test2() public returns(uint  a) {
        uint[2] memory gio;
        gio[0] = 100;
        gio[1] = 200;
        test3(gio);
        return gio[0];
    }
    
    
    function test3(uint[2] storage arr) private returns (uint) {
        arr[0] = 35;
    }
