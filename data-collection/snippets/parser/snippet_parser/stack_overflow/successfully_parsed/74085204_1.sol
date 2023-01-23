import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OurToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("OurToken", "OT") {
        _mint(address(this), initialSupply);
        _approve(address(this), msg.sender, initialSupply);
    }
}
