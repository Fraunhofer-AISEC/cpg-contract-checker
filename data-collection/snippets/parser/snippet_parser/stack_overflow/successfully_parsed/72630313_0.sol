import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    constructor() ERC20("Token", "TOKEN") {}

    function mint(address account, uint256 amount) public {
        _mint(account, amount);
    }
}
