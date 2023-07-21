import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract MyContract {
    IERC20 private _token;

    constructor(address tokenAddress) {
        _token = IERC20(tokenAddress);
    }

    function transferToken(address to, uint256 amount) public {
        _token.transfer(to, amount);
    }
}
