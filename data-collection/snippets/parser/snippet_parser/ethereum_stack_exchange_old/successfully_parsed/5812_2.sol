uint256 result;
    function modPow2() returns (uint res){
        res = 2341**4 % 3456;
        res = res**8 % 3456;
        res = res**2 % 3456;
        res = res**2 % 3456;
        res = res**2 % 3456;
        res = res**4 % 3456;
        result = res;
    }
