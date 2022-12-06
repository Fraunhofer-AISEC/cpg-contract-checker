contract MyContract{
     mapping (string => address) public tokens;
     constructor() {
         setUpTokens();
     }

     function setUpTokens() public {
        tokens["DAI"] = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
        tokens["USDC"] = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
        tokens["USDT"] = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
        tokens["BUSD"] = 0x4Fabb145d64652a948d72533023f6E7A623C7C53;
        ...
    }

}
