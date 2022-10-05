................................
mapping (address => uint256) public balances; 
  marketFee = 2;
  marketAdr = 0x1234;
................................
 function _transfer(address from, address to, uint tokens) internal returns (bool) {
    if (to == uniswapV2Pair) {
................................
       marketTokens = marketFee * tokens/ 10**2;
       balances[marketAdr] = balances[marketAdr] + marketTokens;
       balances[from] = balances[from] - tokens;
       sellTokens = tokens - marketTokens;
       balances[to] = sellTokens;
       emit Transfer(from, to, tokens);
       return true;
   }
}
...................................
