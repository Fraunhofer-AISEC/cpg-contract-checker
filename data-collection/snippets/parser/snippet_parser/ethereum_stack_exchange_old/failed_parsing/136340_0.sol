interface IERC20 {
    ...
}
interface IUniswapV2Router {
    ...
}
interface IWETH {
    function deposit() external payable;
    function transfer(address to, uint256 value) external returns (bool);
    function withdraw(uint256) external;
}
contract ABC {
    struct Response {
        uint256 x;
        uint256 y;
        uint256 z;
        uint256 kk;
    }

    function Test() external payable returns (Response memory response) {
        address wethAaddress = IUniswapV2Router(router).WETH();
        IWETH(wethAddress).deposit{value:msg.value}();
        uint256 balance = IERC20(wethAddress).balanceOf(address(this));
        response = Response(msg.value, balance, address(this).balance, msg.sender.balance);
        return response;
    }
}
