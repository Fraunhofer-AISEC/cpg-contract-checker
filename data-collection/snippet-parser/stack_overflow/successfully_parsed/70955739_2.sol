  
pragma solidity >=0.4.22 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";



contract Dex {
    event Approval(
        address indexed tokenOwner,
        address indexed spender,
        uint256 tokens
    );
    event Transfer(address indexed from, address indexed to, uint256 tokens);

    constructor() {}

    function deposit(
        address ticker,
     

   address sender,
        address recipient,
        uint256 amount
    ) external payable {
        IERC20 token = IERC20(ticker);
        IERC20(ticker).approve(sender, amount);
        
        token.transferFrom(sender, recipient, amount);
        emit Transfer(sender, recipient, amount);
    }

}
