contract swaptest{
    address router = 0x9Ac64Cc6e4415144C455BD8E4837Fea55603e5c3;
    address busd = 0x78867BbEeF44f2326bF8DDd1941a4439382EF2A7;
    address usdt = 0x7ef95a0FEE0Dd31b22626fA2e10Ee6A223F8a684;
    address wbnb = 0xae13d989daC2f0dEbFf460aC112a837C89BAa7cd;
    function approve() public {
        IBEP20(0x78867BbEeF44f2326bF8DDd1941a4439382EF2A7).approve(router , 1 ether);
    }
    function swap() public {
        address[] memory path;
        path[0] = busd;
        path[1] = wbnb;
        path[2] = usdt;
        IPancakeRouter02(router).swapExactTokensForTokens( 1 ether , 0 , path , address(this) , block.timestamp );
    }
}
