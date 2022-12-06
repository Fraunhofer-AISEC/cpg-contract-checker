contract Uniswap {


    constructor () public payable {
    }
   
    function getBalance() public view returns (uint) {
        return address(this).balance;    
    }
   
   
   
   function getTokenPrice(address pairAddress, uint amount) public payable returns(uint)
   {
    IUniswapV2Pair pair = IUniswapV2Pair(pairAddress);
    IERC20 token1 = IERC20(pair.token1());
   
   
    (uint Res0, uint Res1,) = pair.getReserves();

    
    uint res0 = Res0*(10**token1.decimals());
    return((amount*res0)/Res1); 
   }
   
}
