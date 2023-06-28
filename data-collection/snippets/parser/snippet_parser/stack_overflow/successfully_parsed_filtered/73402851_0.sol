pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract METoken is ERC20 {
constructor(uint256 initialSupply) ERC20 ("MAstering ther","MET")
{
    _totalSupply=initialSupply;
    _balances[msg.sender] = initialSupply;
    emit Transfer(address(0), msg.sender, initialSupply);
}
}
