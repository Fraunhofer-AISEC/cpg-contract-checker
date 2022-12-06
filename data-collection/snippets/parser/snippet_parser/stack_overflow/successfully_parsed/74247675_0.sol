pragma solidity 0.5.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/ownership/Ownable.sol";
 
 
contract GToken is ERC20, Ownable {
     
    constructor() ERC20("GToken", "GT") public {
    _mint(msg.sender, 50 * (10**18));
}
}
