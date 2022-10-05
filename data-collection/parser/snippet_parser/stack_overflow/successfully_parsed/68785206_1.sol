    pragma solidity ^0.8.3;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract ACoolToken is ERC20 {
  address public admin;
  
  constructor() ERC20('ACoolToken', 'ACT') {
    _mint(msg.sender, 1000000 * 10 ** 18);
    admin = msg.sender;
  }
  
  function burn(unint amount) external {
      _burn(msg.sender, amount);
  }
  
  function mint(address account, uint256 amount) external {
      require(msg.sender == admin, 'only admin');
      _mint(to, amount);
  }

  
}
