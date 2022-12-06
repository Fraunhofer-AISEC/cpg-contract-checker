
pragma solidity >=0.7.0 <0.9.0;
 
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
 
contract Token is ERC20, Ownable {
 
    constructor () ERC20("Try2", "CRL2") Ownable(){
        mint(msg.sender, 300 * ( 10 ** uint256(decimals())));
    }
 
    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }
 
    function burn(address account, uint256 amount) public onlyOwner {
        _burn(account, amount);
    }
 
}
