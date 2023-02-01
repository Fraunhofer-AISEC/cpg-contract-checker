    address public egg = 0xF952Fc3ca7325Cc27D15885d37117676d25BfdA6;
    address public cake = 0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82;
    address public router = 0xF491e7B69E4244ad4002BC14e878a34207E38c29;
    address public dead = 0x000000000000000000000000000000000000dEaD;
    address public wbnb = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c;
    address[] public route = [cake, wbnb, egg];


    function giveAllowances() external onlyOwner {
        IBEP20(cake).safeApprove(router, uint256(-1));
    }


    function sellCake() public onlyOwner {
        uint256 _bal = IBEP20(cake).balanceOf(address(this));

        if (_bal > 0) {
            IUniswapV2Router02(router).swapExactTokensForTokens(_bal, 0, route, dead, now);
        }
    }
