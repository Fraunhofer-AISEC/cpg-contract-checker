
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DamiKing is ERC20 {
    address public admin;

    event serverStatus(string serverMessage);

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        _mint(msg.sender, 10000 * 10 ** decimals());
        admin = msg.sender;
    }
}
