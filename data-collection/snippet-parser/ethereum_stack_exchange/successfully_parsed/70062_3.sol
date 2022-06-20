    function combine(uint256 a, uint256 b, uint256 d) public view returns(uint256){
         uint256 c = firstContract.one(a, b);
         require(c > 10, "a+b must be superior to 10");
         uint256 e = firstContract.two(c, d);
         require(e > 30, "a+b+d must be superior to 30");
         return e;
    }
