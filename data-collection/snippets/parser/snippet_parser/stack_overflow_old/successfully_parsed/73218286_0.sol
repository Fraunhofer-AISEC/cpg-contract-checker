

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract transferownership is ERC20, Ownable  {

uint256 lastpresence;
uint256 amount = balanceOf(msg.sender);
constructor(uint256 initialSupply) ERC20("interorm", "intr") {
    _mint(msg.sender, initialSupply);
}

function presence() public onlyOwner {
    lastpresence = block.timestamp;
}

function changeOwnership(address newowner) public {
    require(lastpresence < block.timestamp - 356 days);
    transfer(newowner, amount);
    _transferOwnership(newowner);
    lastpresence = block.timestamp;

    
}
}