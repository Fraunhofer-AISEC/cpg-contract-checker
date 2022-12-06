import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Item {
    IERC20 private token;

    constructor(address tokenAddress) {
        token = IERC20(tokenAddress);
    }

    function myMethod() public {
        bool success = token.transferFrom(msg.sender, address(this), 1 ether); 
        require(success, "Insufficient Funds: Requires 1 Token");
        
    }
}
