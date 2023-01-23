contract second{

    first firstContract = first('put here the first contract address');

    function combine(uint256 a, uint256 b, uint256 d) public view returns(uint256){
         uint256 c = firstContract.one(a, b);
         uint256 e = firstContract.two(c, d);
         return e;
    }

}
