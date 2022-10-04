
pragma solidity >=0.5.0;

interface IBakerySwapRouter {
    function swapExactTokensForTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapTokensForExactTokens(
        uint256 amountOut,
        uint256 amountInMax,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapExactBNBForTokens(
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external payable returns (uint256[] memory amounts);
}

interface IBakeryToken{
    function balanceOf(address account) external view returns (uint256);
    function allowance(address _owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
}

contract swap{
    address public Owner;
    uint public Value;
    address addrBakeryToken=0xE02dF9e3e622DeBdD69fb838bB799E3F168902c5;
    address addrBakeryRouter=0xCDe540d7eAFE93aC5fE6233Bee57E1270D3E330F;
    IBakeryToken CBakeryToken;
    IBakerySwapRouter CBakeryRouter;
    event log(address,uint256,address) ;
    event Tansfer(address from, address to, uint count);

    constructor() public{
        Owner=msg.sender;
        CBakeryToken=IBakeryToken(addrBakeryToken);
        CBakeryRouter=IBakerySwapRouter(addrBakeryRouter);
    }

    function fCallBuyAndSell(uint _amountIn) payable external{

        address[] memory path;
        path[0]=0xeD24FC36d5Ee211Ea25A80239Fb8C4Cfd80f12Ee;
        path[1]=0xE02dF9e3e622DeBdD69fb838bB799E3F168902c5;
        CBakeryRouter.swapExactTokensForTokens(
            _amountIn,
            1,
            path,
            0x5e9B3cdBa58249aBCCc0C7B9F53391194a8f128F,
            9993578845
        );
    }

}
