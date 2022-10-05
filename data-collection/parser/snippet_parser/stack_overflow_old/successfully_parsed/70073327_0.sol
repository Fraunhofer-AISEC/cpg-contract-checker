import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TransferToken {
    function transferFrom(IERC20 token, address from, address to, uint amount) public{
        token.transferFrom(from, to, amount);
    }
}
