

pragma solidity 0.6.12;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20("MyToken", "MY") {
    
    constructor(uint256 totalSupply, address tokenOwnerAddress) public payable {

      
      _mint(tokenOwnerAddress, totalSupply);
    }

    
    function burn(uint256 value) public {
      _burn(msg.sender, value);
    }
}
