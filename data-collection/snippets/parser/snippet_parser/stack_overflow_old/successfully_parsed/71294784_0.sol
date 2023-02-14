
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/af7ec04b78c2b5dec330153de90682b13f17a1bb/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/af7ec04b78c2b5dec330153de90682b13f17a1bb/contracts/token/ERC20/extensions/ERC20Burnable.sol";


contract TokenV2 is ERC20, ERC20Burnable {
  address public minter;
  address private owner;

  event MinterChanged(address indexed from, address to);

  constructor() payable ERC20("GameTest", "GAT") {
    owner = msg.sender;
  }

  function passMinterRole(address farm) public returns (bool) {
    require(minter==address(0) || msg.sender==minter, "You are not minter");
    minter = farm;

    emit MinterChanged(msg.sender, farm);
    return true;
  }
  
  function getOwner() public view returns (address) {
      return owner;
  }

  function mint(address account, uint256 amount) public {
    require(minter == address(0) || msg.sender == minter, "You are not the minter");
        _mint(account, amount);
    }

  function burn(address account, uint256 amount) public {
    require(minter == address(0) || msg.sender == minter, "You are not the minter");
        _burn(account, amount);
    }
    
  function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public virtual override returns (bool) {
        if (msg.sender == minter) {
            _transfer(sender, recipient, amount);
            return true;
        }
        
        super.transferFrom(sender, recipient, amount);
       return true;
    }
}
