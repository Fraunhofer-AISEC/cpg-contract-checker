using Chainlink for Chainlink.Request;

address private oracle;
bytes32 private specId;
uint256 private fee;

constructor() {
   setPublicChainlinkToken();
   oracle = 0xCcbB32b820799DDCadCFeEE472B9804a1397005E; 
   specId = "37ab8f92090e4d239b0896495f96899f"; 
   fee = 0.1 * 10 ** 18; 
}
