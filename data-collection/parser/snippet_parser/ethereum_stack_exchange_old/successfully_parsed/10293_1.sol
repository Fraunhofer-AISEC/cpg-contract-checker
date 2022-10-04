    function f() returns (uint, bool, uint) {
        return (7, true, 2);
    }

    function g() {
        
        var (x, b, y) = f();
    }
