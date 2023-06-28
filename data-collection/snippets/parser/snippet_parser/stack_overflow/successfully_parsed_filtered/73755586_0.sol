
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DamiKing is ERC20 {
address public admin;
string name;
string symbol;

event serverStatus(string serverMessage);
constructor() ERC20(name, symbol) 
payable {

    _name = name;
    _symbol = symbol;
    _mint(msg.sender, 10000 * 10 ** decimals());
    admin = msg.sender;
}
}