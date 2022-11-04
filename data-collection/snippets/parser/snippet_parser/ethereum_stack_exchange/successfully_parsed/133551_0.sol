pragma solidity >=0.8.7;

interface IERC20 {
    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);

    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool);
    function deposit() external payable;
}

interface IQuickSwapRouter
{
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
        ) external returns (uint[] memory amounts);
}

contract swapToken {

    function swap(address contractRouter, address tokenAddr, address[] memory path, uint256 nbtoken, address to) public {
        

        IERC20(tokenAddr).transferFrom(msg.sender, address(this), nbtoken);

        IERC20(tokenAddr).approve(contractRouter, nbtoken);

        IQuickSwapRouter(contractRouter).swapExactTokensForTokens(
        nbtoken, 
        0, 
        path, 
        to, 
        block.timestamp);

    }
}
