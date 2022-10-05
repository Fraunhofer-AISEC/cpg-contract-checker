import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {

    constructor() ERC20("MyToken", "MYT") {

    }

}
