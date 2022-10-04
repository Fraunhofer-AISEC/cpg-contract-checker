import "./first.sol";

contract second{

first firstContract = 
first(0x0FdF4894a3b7C5a101686829063BE52Ad45bcfb7);

    function combine(uint256 a, uint256 b, uint256 d) public view returns(uint256){
         uint256 c = firstContract.one(a, b);
         uint256 e = firstContract.two(c, d);
         return e;
    }

}
