pragma solidity >=0.8.14;

interface IERC20 {
    function totalSupply() external view returns (uint);

    function balanceOf(address account) external view returns (uint);

    function transfer(address recipient, uint amount) external returns (bool);

    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint amount) external returns (bool);

    function transferFrom(address sender, address recipient, uint amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}

interface IUniswapV2Router {
    function getAmountsOut(uint256 amountIn, address[] memory path) external view returns (uint256[] memory amounts);

    function swapExactTokensForTokens(uint256 amountIn, uint256 amountOutMin, address[] calldata path, address to, uint256 deadline) external returns (uint256[] memory amounts);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(uint256 amountIn, uint256 amountOutMin, address[] calldata path, address to, uint256 deadline) external returns (uint256[] memory amounts);
}


contract SwapTradeExecution {
    address owner;

    constructor(){
        
        owner = msg.sender;
    }

    modifier onlyOwner() {
        
        require(msg.sender == owner, "Only the owner is allowed to execute");
        _;
    }

    function swapFeeOn(address router, address _tokenIn, address _tokenOut, uint256 _amount) internal {
        
        IERC20(_tokenIn).approve(router, _amount);
        address[] memory path;
        path = new address[](2);
        path[0] = _tokenIn;
        path[1] = _tokenOut;
        uint deadline = block.timestamp + 300;
        IUniswapV2Router(router).swapExactTokensForTokensSupportingFeeOnTransferTokens(_amount, 0, path, address(this), deadline);
    }

    function swapExternal(address router, address _tokenIn, address _tokenOut, uint256 _amount, uint256 minAmount) external onlyOwner {
        
        IERC20(_tokenIn).approve(router, _amount);
        address[] memory path;
        path = new address[](2);
        path[0] = _tokenIn;
        path[1] = _tokenOut;
        uint deadline = block.timestamp + 300;
        IUniswapV2Router(router).swapExactTokensForTokens(_amount, minAmount, path, address(this), deadline);
    }


    function swapFeeOnExternal(address router, address _tokenIn, address _tokenOut, uint256 _amount,uint256 minAmount) external onlyOwner {
        
        IERC20(_tokenIn).approve(router, _amount);
        address[] memory path;
        path = new address[](2);
        path[0] = _tokenIn;
        path[1] = _tokenOut;
        uint deadline = block.timestamp + 300;
        IUniswapV2Router(router).swapExactTokensForTokensSupportingFeeOnTransferTokens(_amount, minAmount, path, address(this), deadline);
    }

    function tokenBalance(address token) public view returns (uint256) {
        IERC20 token = IERC20(token);
        return token.balanceOf(address(this));
    }

    function withdrawFunds(address token) external onlyOwner {
        IERC20 token = IERC20(token);
        uint balance = token.balanceOf(address(this));
        require(balance > 0, "No avaliable fund to withdraw");
        token.transfer(msg.sender, balance);
    }
}
