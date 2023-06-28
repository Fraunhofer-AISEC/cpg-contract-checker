pragma solidity 0.8.17;

import "solmate/src/tokens/ERC20.sol";
import "solmate/src/utils/SafeTransferLib.sol";


contract ERC20Mintable is ERC20 {
  
  using SafeTransferLib for ERC20;


  constructor (string memory name, string memory code, uint8 decimal) 
    ERC20(name, code, decimal) 
  {

  }

  function mint(address to, uint amount) public {
    _mint(to, amount);
  }

  function safeTrans(address to, uint amount) public {

    ERC20(this).safeApprove(to, amount);

    ERC20(this).safeTransfer(to, amount);

  }

}

