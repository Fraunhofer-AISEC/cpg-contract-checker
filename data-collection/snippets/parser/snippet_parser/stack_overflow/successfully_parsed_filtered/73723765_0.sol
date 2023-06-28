contract Demo {
    function add1(uint256 a, uint256 b) public pure returns (uint256) { 
        if (a==0) {
            return 0;
        }

        uint256 c = a + b;
        return c;
    }
}

