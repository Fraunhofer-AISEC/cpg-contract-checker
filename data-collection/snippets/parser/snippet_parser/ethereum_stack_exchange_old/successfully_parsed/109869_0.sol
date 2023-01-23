contract PPInvester{
using SafeMath for uint256;

IPancakeRouter private _pancakeRouter = IPancakeRouter(0x9Ac64Cc6e4415144C455BD8E4837Fea55603e5c3);
address[] private _pairs;
string[] private _pairsName;

constructor(address[] memory pairs, string[] memory pairsName){
    _pairs = pairs;
    _pairsName = pairsName;
}

function deposit() public payable {
    uint256 ammountPerToken = SafeMath.div(msg.value, _pairs.length);

    for(uint index = 0; index < _pairs.length ; index++){   
        buyAMMTokens(msg.sender, payable(address(_pairs[index])), ammountPerToken);
    }   
}

function buyAMMTokens(address to, address payable tokenAddress, uint256 amountIn) internal {
    address[] memory path = new address[](2);
    path[0] = _pancakeRouter.WETH();
    path[1] = tokenAddress;

    uint256[] memory amounts = _pancakeRouter.getAmountsOut(amountIn, path);

    _pancakeRouter.swapExactETHForTokens{ value: amountIn }(amounts[1], path, to, block.timestamp);
}
}