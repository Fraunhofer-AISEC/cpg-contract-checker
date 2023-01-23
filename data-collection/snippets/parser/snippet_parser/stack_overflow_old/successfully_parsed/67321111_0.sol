

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {

  

  

  constructor() public payable ERC20("Name", "Symbol") {

    

  }

  

  function mint(address account, uint256 amount) public {

    

    _mint(account, amount);

  }

}
